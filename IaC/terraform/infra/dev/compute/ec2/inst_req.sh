#!/bin/bash

sudo yum update -y
sudo yum install -y python3 python3-pip postgresql15 postgresql15-server

sudo postgresql-setup --initdb
sudo systemctl start postgresql
sudo systemctl enable postgresql

sudo -u ec2-user python3 -m pip install --user --upgrade pip
sudo -u ec2-user python3 -m pip install --user flask flask-sqlalchemy psycopg2-binary awscli boto3 six bleach blinker certifi click colorama distlib filelock itsdangerous Jinja2 MarkupSafe marshmallow marshmallow-sqlalchemy packaging pipenv platformdirs setuptools SQLAlchemy SQLAlchemy-Utils typing_extensions virtualenv webencodings Werkzeug

aws s3 cp s3://lambda-codes-zip/prj.py /home/ec2-user/app.py

sudo chown ec2-user:ec2-user /home/ec2-user/app.py
sudo chmod 644 /home/ec2-user/app.py

cat << EOT | sudo tee /etc/systemd/system/recipe-app.service > /dev/null
[Unit]
Description=Recipe App
After=network.target

[Service]
User=ec2-user
WorkingDirectory=/home/ec2-user
ExecStart=/usr/bin/python3 /home/ec2-user/app.py
Restart=always

[Install]
WantedBy=multi-user.target
EOT

sudo systemctl daemon-reload
sudo systemctl enable recipe-app
sudo systemctl start recipe-app
