module "nlb" {
  source      = "../../../../modules/compute/lb/nlb"
  lb_name     = "nlb-appln"
  lb_type     = "network"
  subnets     = [data.terraform_remote_state.nets.outputs.bastion_subnet_id]
  nlb_tg_name = "nlb-tg-1"
  target_type = "ip"
  appln_port  = var.port
  vpc_id      = data.terraform_remote_state.nets.outputs.net_b_id
  target_ids  = [data.terraform_remote_state.vms.outputs.vm_app_1_priv_ip, data.terraform_remote_state.vms.outputs.vm_app_2_priv_ip]
}
