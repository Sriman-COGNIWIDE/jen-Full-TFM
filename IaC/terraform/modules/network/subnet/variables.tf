variable "vpc_id" {
  type        = string
  description = "Vpc ID"
}

variable "subnet_cidr" {
  type        = string
  description = "Subnet cidr"
}

variable "subnet_az" {
  type        = string
  description = "Subnet Availability Zone"
}

variable "subnet_name" {
  type        = string
  description = "Subnet name"
}
