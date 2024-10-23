output "rds_instance_id" {
  description = "RDS Instance ID for the created Database service"
  value       = module.rds_postgres.rds_instance_id
}

output "rds_endpoint" {
  description = "RDS Endpoint for the created Database service"
  value       = module.rds_postgres.rds_endpoint
}

output "rds_security_group_id" {
  description = "Security Group ID of the RDS Instance"
  value       = module.rds_postgres.rds_security_group_id
}

output "random_pass" {
  description = "Random password generated that is attached as password for the RDS Instance"
  value       = module.rds_postgres.random_pass
  sensitive   = true
} 