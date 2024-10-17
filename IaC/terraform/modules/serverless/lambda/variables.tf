variable "db_password" {
  type = string
}

variable "db_host" {
  type = string
}

variable "db_port" {
  type = string
}

variable "db_name" {
  type = string
}

variable "db_username" {
  type = string
}

variable "rds_sg" {
  type    = string
  default = " "
}

variable "vpc_id" {
  type    = string
  default = " "
}

variable "subnet_1_id" {
  type    = string
  default = " "
}

variable "subnet_2_id" {
  type    = string
  default = " "
}

variable "create_role" {
  type    = bool
  default = false
}

variable "create_sg" {
  type    = bool
  default = false
}

variable "create_layer" {
  type    = bool
  default = false
}

variable "s3_bucket" {
  type    = string
  default = ""
}

variable "s3_key" {
  type    = string
  default = ""
}

variable "runtime" {
  type    = string
  default = ""
}

variable "handler" {
  type    = string
  default = ""
}

variable "function_name" {
  type    = string
  default = ""
}

variable "role_arn" {
  type    = string
  default = ""
}

variable "sg_id" {
  type    = string
  default = ""
}

variable "layer_name" {
  type    = string
  default = ""
}

variable "layer_arn" {
  type    = string
  default = ""
}

variable "layer_s3_key" {
  type    = string
  default = ""
}

variable "sg_name" {
  type    = string
  default = ""
}

variable "role_name" {
  type    = string
  default = ""
}

variable "run_test" {
  type    = bool
  default = false
}

variable "policy" {
  type    = string
  default = " "
}

variable "payload_file" {
  type = string
}
