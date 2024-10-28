output "rds_instance_id" {
  value       = aws_db_instance.pg.id
  description = "Unique identifier assigned to the RDS database instance in AWS"
}

output "rds_endpoint" {
  value       = aws_db_instance.pg.endpoint
  description = "Connection endpoint URL for accessing the RDS database instance and port"
}

output "rds_security_group_id" {
  value       = aws_security_group.db_sg.id
  description = "Security group ID controlling network access rules for the RDS instance"
}

output "db_subnet_group" {
  value       = aws_db_subnet_group.subnet_group.name
  description = "Name of the subnet group where RDS instance is deployed across AZs"
}

output "random_pass" {
  value       = random_password.pass.result
  sensitive   = true
  description = "Securely generated random password for database master user authentication"
}