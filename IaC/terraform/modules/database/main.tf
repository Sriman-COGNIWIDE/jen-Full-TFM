resource "aws_db_subnet_group" "subnet_group" {
  name       = "subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name            = "DB Subnet Group"
    Deployment_mode = "terraform"
  }
}

resource "aws_security_group" "db_sg" {
  name        = "security-group"
  description = "Security group for RDS"
  vpc_id      = var.vpc_id

  ingress {
    description = "DB Ingress"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = var.ingress_cidr_block
  }

  tags = {
    Name            = "RDS Security Group"
    Deployment_mode = "terraform"
  }
}

resource "random_password" "pass" {
  length  = 16
  special = false
}

resource "aws_secretsmanager_secret" "rds_creds" {
  name                    = "rds_credentials"
  recovery_window_in_days = 0
} 

resource "aws_db_instance" "pg" {
  identifier        = var.db_identifier
  engine            = "postgres"
  engine_version    = "15"
  instance_class    = var.instance_class
  allocated_storage = var.allocated_storage

  db_name  = var.db_name
  username = var.db_username
  password = random_password.pass.result

  multi_az               = false
  db_subnet_group_name   = aws_db_subnet_group.subnet_group.name
  vpc_security_group_ids = [aws_security_group.db_sg.id]

  publicly_accessible = false
  skip_final_snapshot = true
  deletion_protection = false

  storage_encrypted = true

  tags = {
    Name            = "RDS Instance"
    Deployment_mode = "terraform"
  }
}

resource "aws_secretsmanager_secret_version" "rds_creds" {
  secret_id = aws_secretsmanager_secret.rds_creds.id
  secret_string = jsonencode({
    db_username = var.db_username
    db_password = random_password.pass.result
    db_endpoint = split(":", aws_db_instance.pg.endpoint)[0]
    db_port     = aws_db_instance.pg.port
    db_name     = aws_db_instance.pg.db_name
  })
}
