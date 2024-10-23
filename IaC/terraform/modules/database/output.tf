output "rds_instance_id" {
  value       = aws_db_instance.pg.id
  description = "database instance identifier"
}

output "rds_endpoint" {
  value       = aws_db_instance.pg.endpoint
  description = "database connection endpoint"
}

output "rds_security_group_id" {
  value       = aws_security_group.db_sg.id
  description = "database security group"
}

output "db_subnet_group" {
  value       = aws_db_subnet_group.subnet_group.name
  description = "subnet group name"
}

output "random_pass" {
  value       = random_password.pass.result
  sensitive   = true
  description = "generated db password"
}