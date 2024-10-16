output "rds_instance_id" {
  value = aws_db_instance.pg.id
}

output "rds_endpoint" {
  value = aws_db_instance.pg.endpoint
}

output "rds_security_group_id" {
  value = aws_security_group.postgres_sg.id
}

output "db_subnet_group" {
  value = aws_db_subnet_group.postgres_subnet_group.name
}

output "random_pass" {
  value     = random_password.pass.result
  sensitive = true
}
