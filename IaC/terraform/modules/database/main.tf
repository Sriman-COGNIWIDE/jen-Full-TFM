resource "aws_db_subnet_group" "postgres_subnet_group" {
  name       = "postgres-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "PostgreSQL DB Subnet Group"
  }
}

resource "aws_security_group" "postgres_sg" {
  name        = "postgres-security-group"
  description = "Security group for PostgreSQL RDS"
  vpc_id      = var.vpc_id

  ingress {
    description = "Postgres Ingress"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.1.2.0/24"]
  }

  tags = {
    Name = "PostgreSQL RDS Security Group"
  }
}

resource "aws_db_instance" "pg" {
  identifier        = var.db_identifier
  engine            = var.engine
  engine_version    = var.engine_version
  instance_class    = var.instance_class
  allocated_storage = var.allocated_storage

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password

  multi_az               = false
  db_subnet_group_name   = aws_db_subnet_group.postgres_subnet_group.name
  vpc_security_group_ids = [aws_security_group.postgres_sg.id]

  publicly_accessible = false
  skip_final_snapshot = true
  deletion_protection = false

  storage_encrypted = true

  tags = {
    Name = "PostgreSQL RDS Instance"
  }
}