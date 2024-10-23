variable "vpc_id" {
  type        = string
  description = "VPC id"
}

variable "rt_name" {
  type        = string
  description = "Name for route table"
}

variable "gateway_id" {
  type        = string
  default     = ""
  description = "Gateway ID for route table"
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnet IDs for route table"
}