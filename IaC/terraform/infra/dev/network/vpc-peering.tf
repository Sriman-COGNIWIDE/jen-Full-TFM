module "vpc_peering" {
  source           = "../../../modules/network/peering/vpc-peering"
  requestor_vpc_id = module.net_a.vpc_id
  acceptor_vpc_id  = module.net_b.vpc_id
  rt_1 = [module.subnet_b_rt.route_table_id,
  module.subnet_c_rt.route_table_id]
  rt_2 = [module.net_b-subnets.subnet_c.subnet_cidr,
  module.net_a-subnets.subnet_b.subnet_cidr]
} 