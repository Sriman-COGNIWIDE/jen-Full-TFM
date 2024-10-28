variable "requestor_vpc_id" {
  type        = string
  description = "ID of the VPC initiating the peering connection request"
}

variable "acceptor_vpc_id" {
  type        = string
  description = "ID of the VPC accepting the peering connection request"
}

variable "rt_1" {
  type        = list(string)
  description = "List of route table IDs in the requestor VPC for peering routes"
}

variable "rt_2" {
  type        = list(string)
  description = "List of CIDR blocks to be routed through the VPC peering connection"
}

variable "deployment_mode" {
  type        = string
  description = "Environment designation for VPC peering like production, staging or development"
}