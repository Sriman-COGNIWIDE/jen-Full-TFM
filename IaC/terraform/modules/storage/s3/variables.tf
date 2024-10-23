variable "bucket_name" {
  type        = string
  description = "name of s3 bucket"
}

variable "acl" {
  type        = string
  default     = "private"
  description = "access control for bucket"
}

variable "obj_path" {
  type        = string
  default     = ""
  description = "path to upload object"
}

variable "upload_obj" {
  type        = bool
  default     = false
  description = "enable object upload flag"
}

variable "vpc_id" {
  type        = string
  default     = ""
  description = "id of target vpc"
}

variable "service_name" {
  type        = string
  default     = ""
  description = "name of aws service"
}

variable "route_table_ids" {
  type        = list(string)
  default     = []
  description = "list of route tables"
}

variable "create_endpoint" {
  type        = bool
  default     = false
  description = "create vpc endpoint flag"
}

variable "allowed_role_arns" {
  type        = list(string)
  default     = []
  description = "allowed aws role arns"
}

variable "acc_id" {
  type        = string
  default     = " "
  description = "aws account identifier number"
}

variable "allowed_ip" {
  type        = list(string)
  default     = [" "]
  description = "list of allowed ips"
}

variable "policy_file" {
  type        = string
  default     = ""
  description = "path to policy file"
}