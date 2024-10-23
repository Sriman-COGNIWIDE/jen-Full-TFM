variable "vpc_id" {
  type        = string
  default     = ""
  description = "vpc id"
}

variable "igw_name" {
  type        = string
  default     = "igw"
  description = "internet gateway name"
}

variable "subnet_id" {
  type        = string
  description = "subnet id"
}

variable "nat_name" {
  type        = string
  default     = "nat"
  description = "nat gateway name"
}

variable "pub_rt_id" {
  type        = string
  description = "public route table id"
}

variable "priv_rt_id" {
  type        = string
  default     = " "
  description = "private route table id"
}

variable "create_igw" {
  type        = bool
  default     = false
  description = "create internet gateway"
}

variable "create_nat" {
  type        = bool
  default     = false
  description = "create nat gateway"
}

variable "create_igw_rte" {
  type        = bool
  default     = false
  description = "create igw route"
}

variable "create_nat_rte" {
  type        = bool
  default     = false
  description = "create nat route"
}