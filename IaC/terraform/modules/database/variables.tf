variable "vpc_id" {
  type        = string
  description = "vpc for db provision"
}

variable "subnet_ids" {
  type        = list(string)
  description = "subnets for database"
}

variable "db_identifier" {
  type        = string
  description = "database name identifier"
}

variable "db_name" {
  type        = string
  description = "name of database"
}

variable "db_username" {
  type        = string
  description = "database user"
}

variable "db_password" {
  type        = string
  sensitive   = true
  description = "database login password"
}

variable "instance_class" {
  type        = string
  description = "database instance size"
}

variable "allocated_storage" {
  type        = number
  description = "database storage size"
}

variable "ingress_cidr_block" {
  type        = list(string)
  description = "allowed ingrss"
}