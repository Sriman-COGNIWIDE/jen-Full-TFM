output "net_a_id" {
  description = "VPC ID of Network A (VPC-1)"
  value       = module.net_a.vpc_id
}

output "nginx_subnet_id" {
  description = "Subnet ID of the subnet-A (Nginx VM's Subnet)"
  value       = module.net_a-subnets.subnet_a.subnet_id
}

output "connect_subnet_id" {
  description = "Subnet ID of the subnet-B (Connect VM's Subnet)"
  value       = module.net_a-subnets.subnet_b.subnet_id
}

output "igw_1_id" {
  description = "Internet Gateway ID in Network A"
  value       = module.gateway-a.igw_id
}

output "nat_id" {
  description = "NAT Gateway ID in Network B"
  value       = module.gateway-b.nat_id
}

output "igw_2_id" {
  description = "Internet Gateway ID in Network B"
  value       = module.gateway-b.igw_id
}

output "nginx_rt_id" {
  description = "Subnet A associated Route table ID (Nginx VM subnet's Route table)"
  value       = module.subnet_a_rt.route_table_id
}

output "connect_rt_id" {
  description = "Subnet B associated Route table ID (Connect VM subnet's Route table)"
  value       = module.subnet_b_rt.route_table_id
}

output "net_b_id" {
  description = "VPC ID of Network B (VPC-2)"
  value       = module.net_b.vpc_id
}

output "bastion_subnet_id" {
  description = "Subnet ID of the subnet-Bast (Bastion VM's Subnet)"
  value       = module.net_b-subnets.subnet_bast.subnet_id
}

output "app_subnet_id" {
  description = "Subnet ID of the subnet-C (App Vm's Subnet)"
  value       = module.net_b-subnets.subnet_c.subnet_id
}

output "db_subnet_1" {
  description = "Subnet ID of the subnet-D (DB Subnet-1)"
  value       = module.net_b-subnets.subnet_d.subnet_id
}

output "db_subnet_2" {
  description = "Subnet ID of the subnet-E (DB Subnet-2)"
  value       = module.net_b-subnets.subnet_e.subnet_id
}

output "bastion_rt_id" {
  description = "Subnet Bast associated Route table ID (Bastion VM subnet's Route table)"
  value       = module.subnet_bast_rt.route_table_id
}

output "app_rt_id" {
  description = "Subnet C associated Route table ID (App subnet's Route table)"
  value       = module.subnet_c_rt.route_table_id
}

output "db_rt_id" {
  description = "Subnet D & E associated Route table ID (DB subnet's Route table)"
  value       = module.subnet_d_rt.route_table_id
}

output "app_subnet_cidr" {
  description = "Subnet CIDR of the subnet-C (App VM's Subnet)"
  value       = module.net_b-subnets.subnet_c.subnet_cidr
}

output "connect_subnet_cidr" {
  description = "Subnet CIDR of the subnet-B (Connect VM's Subnet)"
  value       = module.net_a-subnets.subnet_b.subnet_cidr
}

output "nginx_subnet_cidr" {
  description = "Subnet CIDR of the subnet-A (Nginx VM's Subnet)"
  value       = module.net_a-subnets.subnet_a.subnet_cidr
}

output "bastion_subnet_cidr" {
  description = "Subnet CIDR of the subnet-Bast (Bastion VM's Subnet)"
  value       = module.net_b-subnets.subnet_bast.subnet_cidr
}

output "db_subnet_1_cidr" {
  description = "Subnet CIDR of the subnet-D (DB Subnet)"
  value       = module.net_b-subnets.subnet_d.subnet_cidr
}

output "db_subnet_2_cidr" {
  description = "Subnet CIDR of the subnet-E (DB Subnet)"
  value       = module.net_b-subnets.subnet_e.subnet_cidr
}

output "vpc_peer_id" {
  description = "VPC Peering ID used to Connect Network-A & Network-B"
  value       = module.vpc_peering.peer_id
}