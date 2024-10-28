module "nlb" {
  source  = "../../../../modules/compute/lb/nlb"
  lb_name = "nlb-appln"
  lb_type = "network"
  subnets = [data.terraform_remote_state.nets.outputs.bastion_subnet_id,
  data.terraform_remote_state.nets.outputs.app_subnet_id]
  nlb_tg_name          = "nlb-tg-1"
  target_type          = "ip"
  enable_cross_zone_lb = true
  appln_port           = 5000
  vpc_id               = data.terraform_remote_state.nets.outputs.net_b_id
  target_ids           = [module.vm_app_1.private_ip, module.vm_app_2.private_ip]
  deployment_mode = "terraform"
}
