variable "api_gtw_name" {
  type    = string
  default = ""
}

variable "protocol" {
  type    = string
  default = ""
}

variable "stage_name" {
  type    = string
  default = "$default"
}

variable "create_api_gtw" {
  type    = bool
  default = false
}

variable "create_integration" {
  type    = bool
  default = false
}

variable "lambda_invoke_arn" {
  type    = string
  default = ""
}

variable "lambda_route_key" {
  type    = string
  default = ""
}

variable "lambda_function_name" {
  type    = string
  default = ""
}

variable "api_gtw_id" {
  type    = string
  default = ""
}

variable "api_gtw_arn" {
  type    = string
  default = ""
}