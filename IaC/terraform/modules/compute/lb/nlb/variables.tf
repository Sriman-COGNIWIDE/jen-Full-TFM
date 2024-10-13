variable "lb_name" {
  type = string
}

variable "lb_type" {
  type = string
}

variable "lb_internal_facing" {
  type    = bool
  default = false
}

variable "subnets" {
  type    = list(string)
  default = [""]
}

variable "del_protection" {
  type    = bool
  default = false
}

variable "vpc_id" {
  type = string
}

variable "protocol" {
  type    = string
  default = "TCP"
}

variable "appln_port" {
  type    = number
  default = 5000
}

variable "nlb_tg_name" {
  type    = string
  default = "nlb_tg_1"
}

variable "target_type" {
  type    = string
  default = "instance"
}

variable "target_id_1" {
  type    = string
  default = ""
}
variable "target_id_2" {
  type    = string
  default = ""
}

variable "listener_port" {
  type    = number
  default = 80
}