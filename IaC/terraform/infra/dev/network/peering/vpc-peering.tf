module "vpc_peering" {
  source           = "../../../../modules/network/peering/vpc-peering"
  requestor_vpc_id = data.terraform_remote_state.nets.outputs.net_a_id
  acceptor_vpc_id  = data.terraform_remote_state.nets.outputs.net_b_id
  rt_1             = [data.terraform_remote_state.nets.outputs.connect_rt_id, data.terraform_remote_state.nets.outputs.app_rt_id]
  rt_2             = [data.terraform_remote_state.nets.outputs.app_subnet_cidr, data.terraform_remote_state.nets.outputs.connect_subnet_cidr]
} 