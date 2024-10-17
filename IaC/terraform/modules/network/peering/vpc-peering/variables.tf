variable "requestor_vpc_id" {
  type = string
}

variable "acceptor_vpc_id" {
  type = string
}

variable "rt_1" {
  type    = list(string)
  default = [""]
}

variable "rt_2" {
  type    = list(string)
  default = [""]
}