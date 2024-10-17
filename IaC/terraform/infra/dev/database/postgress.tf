module "rds_postgres" {
  source            = "../../../modules/database"
  vpc_id            = data.terraform_remote_state.nets.outputs.net_b_id
  subnet_ids        = [data.terraform_remote_state.nets.outputs.db_subnet_1, data.terraform_remote_state.nets.outputs.db_subnet_2]
  db_identifier     = "postgres-db"
  db_name           = "recipes"
  db_username       = "sriman"
  db_password       = module.rds_postgres.random_pass
  instance_class    = "db.t3.medium"
  allocated_storage = 10
  engine            = "postgres"
  engine_version    = "15"
}
