variable "lb_name" {
  type        = string
  description = "name of the load balancer"
}

variable "lb_type" {
  type        = string
  description = "type of the load balancer"
}

variable "lb_internal_facing" {
  type        = bool
  default     = false
  description = "internal or internet facing"
}

variable "subnets" {
  type        = list(string)
  description = "subnets for load balancer"
}

variable "del_protection" {
  type        = bool
  default     = false
  description = "enable deletion protection flag"
}

variable "vpc_id" {
  type        = string
  description = "vpc id for resources"
}

variable "protocol" {
  type        = string
  default     = "TCP"
  description = "protocol for load balancer"
}

variable "appln_port" {
  type        = number
  description = "application listening port number"
}

variable "nlb_tg_name" {
  type        = string
  default     = "nlb_tg_1"
  description = "name of target group"
}

variable "target_type" {
  type        = string
  default     = "instance"
  description = "type of target resource"
}

variable "target_ids" {
  type        = list(string)
  description = "list of target ids"
}

variable "listener_port" {
  type        = number
  default     = 80
  description = "port for load balancer"
}

variable "enable_cross_zone_lb" {
  type        = bool
  description = "enable cross zone balancing"
}