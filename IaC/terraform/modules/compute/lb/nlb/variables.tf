variable "lb_name" {
  type        = string
  description = "Name of the load balancer to be created in AWS environment"
}

variable "lb_type" {
  type        = string
  description = "Type of load balancer to deploy - application, network or gateway"
}

variable "lb_internal_facing" {
  type        = bool
  default     = false
  description = "Specify whether the load balancer is internal or internet-facing for access"
}

variable "subnets" {
  type        = list(string)
  description = "List of subnet IDs where the load balancer will be provisioned"
}

variable "del_protection" {
  type        = bool
  default     = false
  description = "Enable deletion protection to prevent accidental removal of load balancer"
}

variable "vpc_id" {
  type        = string
  description = "ID of Virtual Private Cloud where load balancer resources are deployed"
}

variable "protocol" {
  type        = string
  default     = "TCP"
  description = "Network protocol used for routing traffic through the load balancer"
}

variable "appln_port" {
  type        = number
  description = "Port number on which the target application listens for incoming traffic"
}

variable "nlb_tg_name" {
  type        = string
  default     = "nlb_tg_1"
  description = "Name of the target group to associate with network load balancer"
}

variable "target_type" {
  type        = string
  default     = "instance"
  description = "Type of target resource to register with load balancer target group"
}

variable "target_ids" {
  type        = list(string)
  description = "List of target resource IDs to register with load balancer configuration"
}

variable "listener_port" {
  type        = number
  default     = 80
  description = "Port on which the load balancer listens for incoming client traffic"
}

variable "enable_cross_zone_lb" {
  type        = bool
  description = "Enable cross-zone load balancing for distributing traffic across multiple zones"
}

variable "deployment_mode" {
  type        = string
  description = "Deployment environment mode specification for infrastructure configuration management"
}