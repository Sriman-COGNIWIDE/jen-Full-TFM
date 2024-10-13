from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy
from marshmallow import Schema, fields, validate
from sqlalchemy_utils import database_exists, create_database
from sqlalchemy.exc import IntegrityError
import logging
import bleach
import re
import unicodedata
import json
import os

logging.basicConfig(level=logging.WARNING)

db = SQLAlchemy()

class Recipe(db.Model):
    id = db.Column(db.Integer(), primary_key=True)
    name = db.Column(db.String(255), nullable=False, unique=True)
    description = db.Column(db.Text(), nullable=False)

    def __repr__(self):
        return self.name

    @classmethod
    def get_all(cls):
        return cls.query.all()

    @classmethod
    def get_by_id(cls, id):
        return cls.query.get(id)

    def save(self):
        db.session.add(self)
        db.session.commit()

    def delete(self):
        db.session.delete(self)
        db.session.commit()

class RecipeSchema(Schema):
    id = fields.Integer()
    name = fields.String(validate=validate.Length(min=1, max=255))
    description = fields.String(validate=validate.Length(min=1, max=10000))

recipe_schema = RecipeSchema()
recipes_schema = RecipeSchema(many=True)

def sanitize_input(data):
    if isinstance(data, dict):
        return {k: sanitize_input(v) for k, v in data.items()}
    elif isinstance(data, str):
        cleaned = ''.join(ch for ch in data if unicodedata.category(ch)[0] != "C")
        cleaned = unicodedata.normalize('NFKC', cleaned)
        cleaned = bleach.clean(cleaned)
        cleaned = re.sub(r'\s+', ' ', cleaned)
        return cleaned.strip()
    elif isinstance(data, (int, float)):
        return str(data)[:50]
    elif isinstance(data, list):
        return [sanitize_input(item) for item in data[:1000]]
    return data

def contains_xss(text):
    xss_patterns = [
        r'<script.*?>.*?</script>',
        r'on\w+\s*=',
        r'javascript:',
        r'data:',
        r'<iframe.*?>.*?</iframe>',
        r'<img.*?onerror=',
    ]
    return any(re.search(pattern, str(text), re.IGNORECASE) for pattern in xss_patterns)

def validate_input(data):
    if not isinstance(data, dict):
        return False
    if 'name' not in data or 'description' not in data:
        return False
    if not isinstance(data['name'], str) or not (isinstance(data['description'], (str, int, float, list))):
        return False
    if len(data['name']) > 255 or len(json.dumps(data['description'])) > 10000:
        return False
    return True

def init_db():
    engine = db.engine
    if not database_exists(engine.url):
        create_database(engine.url)
    db.create_all()

def create_app():
    app = Flask(__name__)
    app.config["SQLALCHEMY_DATABASE_URI"] = os.environ.get('DATABASE_URL')
    app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
    app.config['SQLALCHEMY_ECHO'] = False
    db.init_app(app)

    with app.app_context():
        init_db()

    @app.after_request
    def add_security_headers(resp):
        resp.headers['Content-Security-Policy'] = "default-src 'self'"
        return resp

    @app.errorhandler(404)
    def not_found(error):
        return jsonify({"error": "Not found"}), 404

    @app.errorhandler(400)
    def bad_request(error):
        return jsonify({"error": "Bad request"}), 400

    @app.errorhandler(500)
    def internal_error(error):
        return jsonify({"error": "Internal server error"}), 500

    @app.route('/health')
    def health_check():
        try:
            Recipe.query.limit(1).all()
            return jsonify({"status": "Healthy: App and DB connection OK"}), 200
        except Exception as e:
            app.logger.error(f"Health check failed: {str(e)}")
            return jsonify({"status": f"Unhealthy: {str(e)}"}), 500

    @app.route('/')
    def welcome():
        return jsonify({"message": "Welcome to the Recipe Store!"})

    @app.route('/recipes', methods=['GET'])
    def get_all_recipes():
        recipes = Recipe.get_all()
        return jsonify(recipes_schema.dump(recipes))

    @app.route('/recipes', methods=['POST'])
    def create_a_recipe():
        data = request.get_json()
        if not validate_input(data):
            return jsonify({"error": "Invalid input data"}), 400

        if contains_xss(data['name']) or contains_xss(data['description']):
            return jsonify({"error": "XSS detected. Please remove any script tags or potentially malicious content."}), 400

        data = sanitize_input(data)

        if not isinstance(data['description'], str):
            data['description'] = json.dumps(data['description'])

        errors = recipe_schema.validate(data)
        if errors:
            return jsonify({"error": errors}), 400

        existing_recipe = Recipe.query.filter_by(name=data['name']).first()
        if existing_recipe:
            return jsonify({"error": "A recipe with this name already exists"}), 409

        try:
            new_recipe = Recipe(name=data['name'], description=data['description'])
            new_recipe.save()
            return jsonify(recipe_schema.dump(new_recipe)), 201
        except IntegrityError:
            db.session.rollback()
            return jsonify({"error": "A recipe with this name already exists"}), 409
        except Exception as e:
            db.session.rollback()
            return jsonify({"error": str(e)}), 500

    @app.route('/recipe/<int:id>', methods=['GET'])
    def get_recipe(id):
        recipe = Recipe.get_by_id(id)
        if not recipe:
            return jsonify({"error": "Recipe not found"}), 404
        return jsonify(recipe_schema.dump(recipe))

    @app.route('/recipe/<int:id>', methods=['PUT'])
    def update_recipe(id):
        recipe = Recipe.get_by_id(id)
        if not recipe:
            return jsonify({"error": "Recipe not found"}), 404

        data = request.get_json()
        if not validate_input(data):
            return jsonify({"error": "Invalid input data"}), 400

        if ('name' in data and contains_xss(data['name'])) or ('description' in data and contains_xss(data['description'])):
            return jsonify({"error": "XSS detected. Please remove any script tags or potentially malicious content."}), 400

        data = sanitize_input(data)

        if 'description' in data and not isinstance(data['description'], str):
            data['description'] = json.dumps(data['description'])

        errors = recipe_schema.validate(data, partial=True)
        if errors:
            return jsonify({"error": errors}), 400

        try:
            if 'name' in data and data['name'] != recipe.name:
                existing_recipe = Recipe.query.filter_by(name=data['name']).first()
                if existing_recipe:
                    return jsonify({"error": "A recipe with this name already exists"}), 409
            recipe.name = data.get('name', recipe.name)
            recipe.description = data.get('description', recipe.description)
            recipe.save()
            return jsonify({"message": "Recipe changed successfully"}), 200
        except IntegrityError:
            db.session.rollback()
            return jsonify({"error": "A recipe with this name already exists"}), 409
        except Exception as e:
            db.session.rollback()
            return jsonify({"error": str(e)}), 500

    @app.route('/recipe/<int:id>', methods=['DELETE'])
    def delete_recipe(id):
        recipe = Recipe.get_by_id(id)
        if not recipe:
            return jsonify({"error": "Recipe not found"}), 404
        try:
            recipe.delete()
            return jsonify({"message": "Recipe deleted successfully"}), 200
        except Exception as e:
            db.session.rollback()
            return jsonify({"error": str(e)}), 500

    return app

if __name__ == '__main__':
    app = create_app()
    app.run(host=<host>, port=int(os.environ.get(<port>)))
