variable "vpc_id" {
  type = string
}

variable "rt_name" {
  type = string
}

variable "gateway_id" {
  type    = string
  default = ""
}

variable "subnet_ids" {
  type    = list(string)
  default = []
}