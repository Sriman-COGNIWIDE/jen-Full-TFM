variable "vpc_id" {
  type    = string
  default = ""
}

variable "igw_name" {
  type    = string
  default = "igw"
}

variable "subnet_id" {
  type = string
}

variable "nat_name" {
  type    = string
  default = "nat"
}

variable "pub_rt_id" {
  type = string
}

variable "priv_rt_id" {
  type    = string
  default = " "
}

variable "create_igw" {
  type    = bool
  default = false
}

variable "create_nat" {
  type    = bool
  default = false
}

variable "create_igw_rte" {
  type    = bool
  default = false
}

variable "create_nat_rte" {
  type    = bool
  default = false
}