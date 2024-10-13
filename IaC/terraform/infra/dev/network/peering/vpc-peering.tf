module "vpc_peering" {
  source           = "../../../../modules/network/peering/vpc-peering"
  requestor_vpc_id = data.terraform_remote_state.nets.outputs.net_a_id
  acceptor_vpc_id  = data.terraform_remote_state.nets.outputs.net_b_id
  requestor_rt_id  = data.terraform_remote_state.nets.outputs.connect_rt_id
  acceptor_rt_id   = data.terraform_remote_state.nets.outputs.app_rt_id
  requestor_cidr   = data.terraform_remote_state.nets.outputs.connect_subnet_cidr
  acceptor_cidr    = data.terraform_remote_state.nets.outputs.app_subnet_cidr
}