variable "bucket_name" {
  type = string
}

variable "acl" {
  type    = string
  default = "private"
}

variable "obj_path" {
  type    = string
  default = ""
}

variable "upload_obj" {
  type    = bool
  default = false
}

variable "vpc_id" {
  type    = string
  default = ""
}

variable "service_name" {
  type    = string
  default = ""
}

variable "route_table_ids" {
  type    = list(string)
  default = []
}

variable "create_endpoint" {
  type    = bool
  default = false
}

variable "allowed_role_arns" {
  type    = list(string)
  default = []
}

variable "acc_id" {
  type    = string
  default = " "

}