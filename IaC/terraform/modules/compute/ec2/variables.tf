variable "instance_name" {
  type        = string
  description = "name of ec2 instance"
}

variable "instance_type" {
  type        = string
  description = "size of ec2 instance"
}

variable "subnet_id" {
  type        = string
  description = "subnet id for instance"
}

variable "ami" {
  type        = string
  description = "amazon machine image id"
}

variable "vpc_id" {
  type        = string
  description = "vpc id for instance"
}

variable "associate_public_ip_address" {
  type        = bool
  default     = false
  description = "enable public ip address"
}

variable "allow_rmte_exec" {
  type        = bool
  default     = false
  description = "enable remote command execution"
}

variable "remote_exec_cmds" {
  type        = list(string)
  default     = [" pwd"]
  description = "remote commands to execute"
}

variable "create_sg" {
  type        = bool
  default     = false
  description = "create security group toggle"
}

variable "allow_user_data" {
  type        = bool
  default     = false
  description = "enable userdata script execution"
}

variable "sg_id" {
  type        = string
  default     = " "
  description = "security group identifier value"
}

variable "user_data_path" {
  type        = string
  default     = " "
  description = "path to userdata file"
}

variable "allow_rmt_via_bastion" {
  type        = bool
  default     = false
  description = "enable bastion host access"
}

variable "bastion_ip" {
  type        = string
  default     = " "
  description = "ip of bastion host"
}

variable "bastion_username" {
  type        = string
  default     = "ec2-user"
  description = "bastion host login user"
}

variable "bastion_private_key" {
  type        = string
  default     = " "
  description = "bastion ssh key"
}

variable "bastion_port" {
  type        = number
  default     = 22
  description = "bastion ssh port"
}

variable "enable_nginx_ssh" {
  type        = bool
  default     = false
  description = "allow nginx ssh access"
}

variable "enable_nginx_http" {
  type        = bool
  default     = false
  description = "allow nginx http access"
}

variable "enable_connect_ssh" {
  type        = bool
  default     = false
  description = "allow connect ssh access"
}

variable "enable_connect_vpc_peering" {
  type        = bool
  default     = false
  description = "enable connect vpc peering"
}

variable "enable_bastion_ssh" {
  type        = bool
  default     = false
  description = "allow bastion ssh access"
}

variable "enable_app_ssh" {
  type        = bool
  default     = false
  description = "allow app ssh access"
}

variable "enable_app_flask" {
  type        = bool
  default     = false
  description = "enable flask app access"
}

variable "enable_app_vpc_peering_eg" {
  type        = bool
  default     = false
  description = "allow app vpc egress"
}

variable "enable_app_vpc_peering_ig" {
  type        = bool
  default     = false
  description = "allow app vpc ingress"
}

variable "enable_app_db_access" {
  type        = bool
  default     = false
  description = "enable database access rules"
}

variable "enable_ssh" {
  type        = bool
  default     = false
  description = "enable ssh access rules"
}

variable "default_egress_internet" {
  type        = bool
  default     = false
  description = "allow internet egress traffic"
}

variable "sg_ssh_cidr" {
  type        = list(string)
  default     = [" "]
  description = "ssh allowed ip ranges"
}

variable "app_peer_cidr" {
  type        = list(string)
  default     = [" "]
  description = "app peering ip ranges"
}

variable "app_db_cidr" {
  type        = list(string)
  default     = [" "]
  description = "database access ip ranges"
}

variable "user_ip" {
  type        = list(string)
  default     = [" "]
  description = "user ip address ranges"
}

variable "create_iam_role" {
  type        = bool
  default     = false
  description = "create iam role toggle"
}

variable "s3_access_policy" {
  type        = string
  default     = null
  description = "s3 bucket access policy"
}

variable "ec2_assume_role_policy" {
  type        = string
  default     = null
  description = "ec2 role trust policy"
}

variable "key" {
  type        = string
  default     = " "
  description = "ssh key pair name"
}

variable "policy_arns" {
  type        = list(string)
  default     = [""]
  description = "iam policy arn list"
}

variable "custom_policy_files" {
  type        = list(string)
  default     = [""]
  description = "custom policy file paths"
}

variable "add_custom_policies" {
  type        = bool
  default     = false
  description = "enable custom iam policies"
}

variable "add_policy_arns" {
  type        = bool
  default     = false
  description = "attach policy arn list"
}