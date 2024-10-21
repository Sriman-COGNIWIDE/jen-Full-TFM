output "net_a_id" {
  value = module.net_a.vpc_id
}

output "nginx_subnet_id" {
  value = module.net_a-subnets.subnet_a.subnet_id
}

output "connect_subnet_id" {
  value = module.net_a-subnets.subnet_b.subnet_id
}

output "igw_1_id" {
  value = module.gateway-a.igw_id
}

output "nat_id" {
  value = module.gateway-b.nat_id
}

output "igw_2_id" {
  value = module.gateway-b.igw_id
}

output "nginx_rt_id" {
  value = module.subnet_a_rt.route_table_id
}

output "connect_rt_id" {
  value = module.subnet_b_rt.route_table_id
}

output "net_b_id" {
  value = module.net_b.vpc_id
}

output "bastion_subnet_id" {
  value = module.net_b-subnets.subnet_bast.subnet_id
}

output "app_subnet_id" {
  value = module.net_b-subnets.subnet_c.subnet_id
}

output "db_subnet_1" {
  value = module.net_b-subnets.subnet_d.subnet_id
}

output "db_subnet_2" {
  value = module.net_b-subnets.subnet_e.subnet_id
}

output "bastion_rt_id" {
  value = module.subnet_bast_rt.route_table_id
}

output "app_rt_id" {
  value = module.subnet_c_rt.route_table_id
}

output "db_rt_id" {
  value = module.subnet_d_rt.route_table_id
}

output "app_subnet_cidr" {
  value = module.net_b-subnets.subnet_c.subnet_cidr
}

output "connect_subnet_cidr" {
  value = module.net_a-subnets.subnet_b.subnet_cidr
}

output "nginx_subnet_cidr" {
  value = module.net_a-subnets.subnet_a.subnet_cidr
}

output "bastion_subnet_cidr" {
  value = module.net_b-subnets.subnet_bast.subnet_cidr
}

output "db_subnet_1_cidr" {
  value = module.net_b-subnets.subnet_d.subnet_cidr
}

output "db_subnet_2_cidr" {
  value = module.net_b-subnets.subnet_e.subnet_cidr
}

output "vpc_peer_id" {
  value = module.vpc_peering.peer_id
}