output "vm_app_1_id" {
  value = module.vm_app_1.instance_id
}

output "vm_app_2_id" {
  value = module.vm_app_2.instance_id
}

output "vm_app_1_tls_key" {
  value     = module.vm_app_1.tls_key
  sensitive = true
}

output "vm_app_2_tls_key" {
  value     = module.vm_app_2.tls_key
  sensitive = true
}

output "vm_bastion_tls_key" {
  value     = module.vm_bastion.tls_key
  sensitive = true
}

output "vm_nginx_tls_key" {
  value     = module.vm_nginx.tls_key
  sensitive = true
}

output "vm_connect_tls_key" {
  value     = module.vm_connect.tls_key
  sensitive = true
}

output "vm_bastion_public_ip" {
  value = module.vm_bastion.public_ip
}

output "vm_app_1_priv_ip" {
  value = module.vm_app_1.private_ip
}

output "vm_app_2_priv_ip" {
  value = module.vm_app_2.private_ip
}

output "vm_nginx_public_ip" {
  value = module.vm_nginx.public_ip
}

output "vm_app_sg_id" {
  value = module.vm_app_1.security_group_id
}

output "vm_connect_sg_id" {
  value = module.vm_connect.security_group_id
}

output "vm_connect_private_ip" {
  value = module.vm_connect.private_ip
}

output "ami_id" {
  value = data.aws_ami.amznlinux2023.id
}

output "nlb_dns" {
  value = module.nlb.nlb_dns
}