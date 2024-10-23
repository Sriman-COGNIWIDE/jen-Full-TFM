variable "requestor_vpc_id" {
  type        = string
  description = "Requestor VPC ID"
}

variable "acceptor_vpc_id" {
  type        = string
  description = "Acceptor VPC ID"
}

variable "rt_1" {
  type        = list(string)
  description = "Subnet's Route table ids "
}

variable "rt_2" {
  type        = list(string)
  description = "Subnet's cidr"
}