variable "db_password" {
  type        = string
  description = "database password value"
}

variable "db_host" {
  type        = string
  description = "database hostname"
}

variable "db_port" {
  type        = string
  description = "database port number"
}

variable "db_name" {
  type        = string
  description = "database name"
}

variable "db_username" {
  type        = string
  description = "database user"
}

variable "rds_sg" {
  type        = string
  default     = " "
  description = "rds security group"
}

variable "vpc_id" {
  type        = string
  default     = " "
  description = "vpc identifier"
}

variable "subnet_1_id" {
  type        = string
  default     = " "
  description = "first subnet id"
}

variable "subnet_2_id" {
  type        = string
  default     = " "
  description = "second subnet id"
}

variable "create_role" {
  type        = bool
  default     = false
  description = "enable role creation"
}

variable "create_sg" {
  type        = bool
  default     = false
  description = "enable sg creation"
}

variable "create_layer" {
  type        = bool
  default     = false
  description = "enable layer creation"
}

variable "s3_bucket" {
  type        = string
  default     = ""
  description = "s3 bucket name"
}

variable "s3_key" {
  type        = string
  default     = ""
  description = "s3 object path"
}

variable "runtime" {
  type        = string
  default     = ""
  description = "lambda runtime environment"
}

variable "handler" {
  type        = string
  default     = ""
  description = "lambda handler path"
}

variable "function_name" {
  type        = string
  default     = ""
  description = "lambda function name"
}

variable "role_arn" {
  type        = string
  default     = ""
  description = "iam role arn"
}

variable "sg_id" {
  type        = string
  default     = ""
  description = "security group id"
}

variable "layer_name" {
  type        = string
  default     = ""
  description = "lambda layer name"
}

variable "layer_arn" {
  type        = string
  default     = ""
  description = "lambda layer arn"
}

variable "layer_s3_key" {
  type        = string
  default     = ""
  description = "layer s3 path"
}

variable "sg_name" {
  type        = string
  default     = ""
  description = "security group name"
}

variable "role_name" {
  type        = string
  default     = ""
  description = "iam role name"
}

variable "run_test" {
  type        = bool
  default     = false
  description = "enable test run"
}

variable "payload_file" {
  type        = string
  description = "test payload path"
}
