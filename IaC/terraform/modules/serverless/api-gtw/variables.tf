variable "api_gtw_name" {
  type        = string
  default     = ""
  description = "api gateway name"
}

variable "protocol" {
  type        = string
  default     = ""
  description = "api protocol type"
}

variable "stage_name" {
  type        = string
  default     = "$default"
  description = "deployment stage name"
}

variable "create_api_gtw" {
  type        = bool
  default     = false
  description = "create api gateway"
}

variable "create_integration" {
  type        = bool
  default     = false
  description = "enable lambda integration"
}

variable "lambda_invoke_arn" {
  type        = string
  default     = ""
  description = "lambda function arn"
}

variable "lambda_route_key" {
  type        = string
  default     = ""
  description = "api route key"
}

variable "lambda_function_name" {
  type        = string
  default     = ""
  description = "lambda function name"
}

variable "api_gtw_id" {
  type        = string
  default     = ""
  description = "api gateway id"
}

variable "api_gtw_arn" {
  type        = string
  default     = ""
  description = "api gateway arn"
}