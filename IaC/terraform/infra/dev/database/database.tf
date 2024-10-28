module "rds_postgres" {
  source = "../../../modules/database"
  vpc_id = data.terraform_remote_state.nets.outputs.net_b_id
  subnet_ids = [data.terraform_remote_state.nets.outputs.db_subnet_1,
  data.terraform_remote_state.nets.outputs.db_subnet_2]
  db_identifier      = "recipesdb"
  db_name            = "recipes"
  db_username        = "recipe_admin"
  db_password        = module.rds_postgres.random_pass
  instance_class     = "db.t3.medium"
  allocated_storage  = 10
  ingress_cidr_block = [data.terraform_remote_state.nets.outputs.app_subnet_cidr] 
  deployment_mode = "terraform"
} 
