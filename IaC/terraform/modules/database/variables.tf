variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "db_identifier" {
  type = string
}

variable "db_name" {
  type = string
}

variable "db_username" {
  type = string
}

variable "db_password" {
  type      = string
  sensitive = true
}

variable "instance_class" {
  type = string
}

variable "allocated_storage" {
  type = number
}

variable "engine" {
  type    = string
  default = "postgres"
}

variable "engine_version" {
  type    = string
  default = "14.4"
}