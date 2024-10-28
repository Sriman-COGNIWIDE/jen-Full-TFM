module "net_b" {
  source     = "../../../modules/network/vpc"
  cidr_block = "10.1.0.0/16"
  vpc_name   = "net-b"
  deployment_mode = "terraform"
}

module "net_b-subnets" {
  source      = "../../../modules/network/subnet"
  for_each    = var.net_b-subnet
  vpc_id      = module.net_b.vpc_id
  subnet_name = each.value.subnet_name
  subnet_cidr = each.value.subnet_cidr
  subnet_az   = each.value.subnet_az
  deployment_mode = "terraform"
}

module "subnet_bast_rt" {
  source     = "../../../modules/network/route-table"
  vpc_id     = module.net_b.vpc_id
  rt_name    = "bastion-rt"
  subnet_ids = [module.net_b-subnets.subnet_bast.subnet_id]
  deployment_mode = "terraform"
}

module "subnet_c_rt" {
  source     = "../../../modules/network/route-table"
  vpc_id     = module.net_b.vpc_id
  rt_name    = "app-rt"
  subnet_ids = [module.net_b-subnets.subnet_c.subnet_id]
  deployment_mode = "terraform"
}

module "subnet_d_rt" {
  source     = "../../../modules/network/route-table"
  vpc_id     = module.net_b.vpc_id
  rt_name    = "db-rt"
  subnet_ids = [module.net_b-subnets.subnet_d.subnet_id, module.net_b-subnets.subnet_e.subnet_id]
  deployment_mode = "terraform"
}

module "gateway-b" {
  source         = "../../../modules/network/gateway"
  create_igw     = true
  create_nat     = true
  vpc_id         = module.net_b.vpc_id
  subnet_id      = module.net_b-subnets.subnet_bast.subnet_id
  pub_rt_id      = module.subnet_bast_rt.route_table_id
  priv_rt_id     = module.subnet_c_rt.route_table_id
  igw_name       = "ig-bastion"
  create_igw_rte = true
  nat_name       = "nat-app"
  create_nat_rte = true
  deployment_mode = "terraform"
}