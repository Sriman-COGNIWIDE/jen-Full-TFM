variable "instance_name" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "ami" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "associate_public_ip_address" {
  type    = bool
  default = false
}

variable "allow_rmte_exec" {
  type    = bool
  default = false
}

variable "allow_file_prov" {
  type    = bool
  default = false
}

variable "allow_multi_file_prov" {
  type    = bool
  default = false
}

variable "file-prov" {
  type    = bool
  default = false
}

variable "lcl-exec" {
  type    = bool
  default = false
}

variable "cidr_blocks" {
  type    = list(string)
  default = []
}

variable "int_cidr" {
  type        = string
  description = "this is the internet cidr"
  default     = "0.0.0.0/32"
}

variable "local_exec_cmds" {
  type    = string
  default = ""
}

variable "remote_exec_cmds" {
  type    = list(string)
  default = [" pwd"]
}

variable "src_path" {
  type    = string
  default = " "
}

variable "src_1" {
  type    = string
  default = " "
}

variable "src_2" {
  type    = string
  default = " "
}

variable "dest_path" {
  type    = string
  default = ""
}

variable "dest_1" {
  type    = string
  default = ""
}

variable "dest_2" {
  type    = string
  default = ""
}

variable "key_path" {
  type    = string
  default = ""
}

variable "file_name" {
  type    = string
  default = "bastion"
}

variable "ingress_rules" {
  type    = list(list(string))
  default = [[""]]

}

variable "egress_rules" {
  type    = list(list(string))
  default = [[""]]

}

variable "create_sg" {
  type    = bool
  default = false
}

variable "allow_user_data" {
  type    = bool
  default = false
}

variable "sg_id" {
  type    = string
  default = " "
}

variable "user_data_path" {
  type    = string
  default = " "
}

variable "allow_fp_via_bastion" {
  type    = bool
  default = false
}
variable "allow_rmt_via_bastion" {
  type    = bool
  default = false
}

variable "bastion_ip" {
  type    = string
  default = " "
}

variable "bastion_username" {
  type    = string
  default = "ec2-user"
}

variable "bastion_private_key" {
  type    = string
  default = " "
}

variable "bastion_port" {
  type    = number
  default = 22
}

variable "enable_nginx_ssh" {
  type    = bool
  default = false
}

variable "enable_nginx_http" {
  type    = bool
  default = false
}

variable "enable_connect_ssh" {
  type    = bool
  default = false
}

variable "enable_connect_vpc_peering" {
  type    = bool
  default = false
}

variable "enable_bastion_ssh" {
  type    = bool
  default = false
}

variable "enable_app_ssh" {
  type    = bool
  default = false
}

variable "enable_app_flask" {
  type    = bool
  default = false
}

variable "enable_app_vpc_peering_eg" {
  type    = bool
  default = false
}

variable "enable_app_vpc_peering_ig" {
  type    = bool
  default = false
}

variable "enable_app_db_access" {
  type    = bool
  default = false
}

variable "enable_ssh" {
  type    = bool
  default = false
}

variable "default_egress_internet" {
  type    = bool
  default = false
}

variable "sg_ssh_cidr" {
  type    = list(string)
  default = [" "]
}

variable "app_peer_cidr" {
  type    = list(string)
  default = [" "]
}

variable "app_db_cidr" {
  type    = list(string)
  default = [" "]
}

variable "my_ip" {
  type    = list(string)
  default = [" "]
}

variable "create_iam_role" {
  type    = bool
  default = false
}


variable "s3_access_policy" {
  type    = string
  default = null
}

variable "ec2_assume_role_policy" {
  type    = string
  default = null
}

variable "key" {
  type    = string
  default = " "
}