variable "vpc_id" {
  type        = string
  description = "VPC ID where RDS database instance will be provisioned"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs where database can be placed for high availability"
}

variable "db_identifier" {
  type        = string
  description = "Unique identifier name for the RDS database instance in AWS"
}

variable "db_name" {
  type        = string
  description = "Name of the initial database to be created on RDS instance"
}

variable "db_username" {
  type        = string
  description = "Master username for accessing and administering the RDS database instance"
}

variable "db_password" {
  type        = string
  sensitive   = true
  description = "Secure password for database master user authentication and access control"
}

variable "instance_class" {
  type        = string
  description = "AWS RDS instance type determining CPU, memory, and network capacity"
}

variable "allocated_storage" {
  type        = number
  description = "Amount of storage in gigabytes allocated to the RDS instance"
}

variable "ingress_cidr_block" {
  type        = list(string)
  description = "List of CIDR blocks allowed to connect to database security group"
}

variable "deployment_mode" {
  type        = string
  description = "Specifies the deployment environment mode like production, staging or development"
}