output "rds_instance_id" {
  value = module.rds_postgres.rds_instance_id
}

output "rds_endpoint" {
  value = module.rds_postgres.rds_endpoint
}

output "rds_security_group_id" {
  value = module.rds_postgres.rds_security_group_id
}
