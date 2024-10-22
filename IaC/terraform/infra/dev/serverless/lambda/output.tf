output "__gtw_url" {
  description = "Endpoint URL for the HTTP API gateway"
  value       = module.http_api_gateway.api_gateway_url
}

output "layer_arn" {
  description = "ARN of the layer created"
  value       = module.get_lambda.layer_arn
}

output "lambda_sg_id" {
  description = "Security Group ID of the Lambda"
  value       = module.get_lambda.security_group_id
}

output "lambda_role_arn" {
  description = "ARN of the lamvda assume role"
  value       = module.get_lambda.role_arn
}

output "get_recipe_output" {
  description = "Output of the Get-recipe Lambda Invocation"
  value       = module.get_lambda.get_lambda_test_result
}

output "get_by_id_recipe_output" {
  description = "Output of the GET-BY-ID-recipe Lambda Invocation"
  value       = module.get_by_id_lambda.get_by_id_lambda_test_result
}

output "post_recipe_output" {
  description = "Output of the POST-recipe Lambda Invocation"
  value       = module.post_lambda.post_lambda_test_result
}

output "put_recipe_output" {
  description = "Output of the PUT-recipe Lambda Invocation"
  value       = module.put_lambda.put_lambda_test_result
}

output "delete_recipe_output" {
  description = "Output of the DELETE-recipe Lambda Invocation"
  value       = module.delete_lambda.delete_lambda_test_result
}

output "get-recipe-id" {
  description = "ID of the GET-recipe Lambda function"
  value       = module.get_lambda.lambda_id
}

output "get-by-id-recipe-id" {
  description = "ID of the GET-BY-ID-recipe Lambda function"
  value       = module.get_by_id_lambda.lambda_id
}

output "post-recipe-id" {
  description = "ID of the POST-recipe Lambda function"
  value       = module.post_lambda.lambda_id
}

output "put-recipe-id" {
  description = "ID of the PUT-recipe Lambda function"
  value       = module.put_lambda.lambda_id
}

output "delete-recipe-id" {
  description = "ID of the DELETE-recipe Lambda function"
  value       = module.delete_lambda.lambda_id
}

output "get-recipe-arn" {
  description = "ARN of the GET-recipe Lambda function"
  value       = module.get_lambda.invoke_arn
}

output "get-by-id-recipe-arn" {
  description = "ARN of the GET-BY-ID-recipe Lambda function"
  value       = module.get_by_id_lambda.invoke_arn
}

output "post-recipe-arn" {
  description = "ARN of the POST-recipe Lambda function"
  value       = module.post_lambda.invoke_arn
}

output "put-recipe-arn" {
  description = "ARN of the PUT-recipe Lambda function"
  value       = module.put_lambda.invoke_arn
}

output "delete-recipe-arn" {
  description = "ARN of the DELETE-recipe Lambda function"
  value       = module.delete_lambda.invoke_arn
}

output "http-api-gtw-id" {
  description = "API gateway ID for the HTTP API gateway created"
  value       = module.http_api_gateway.api_gtw_id
}

output "http-api-gtw-arn" {
  description = "ARN for the HTTP API gateway created"
  value       = module.http_api_gateway.api_gtw_execution_arn
}