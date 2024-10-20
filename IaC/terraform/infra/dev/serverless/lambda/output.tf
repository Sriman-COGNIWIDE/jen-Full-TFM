output "__gtw_url" {
  value = module.http_api_gateway.api_gateway_url
}

output "layer_arn" {
  value = module.get_lambda.layer_arn
}

output "lambda_sg_id" {
  value = module.get_lambda.security_group_id
}

output "lambda_role_arn" {
  value = module.get_lambda.role_arn
}

output "get_recipe_output" {
  value = module.get_lambda.get_lambda_test_result
}

output "get_by_id_recipe_output" {
  value = module.get_by_id_lambda.get_by_id_lambda_test_result
}

output "post_recipe_output" {
  value = module.post_lambda.post_lambda_test_result
}

output "put_recipe_output" {
  value = module.put_lambda.put_lambda_test_result
}

output "delete_recipe_output" {
  value = module.delete_lambda.delete_lambda_test_result
}

output "get-recipe-fn-name" {
  value = module.get_lambda.function_name
}

output "get-by-id-recipe-fn-name" {
  value = module.get_by_id_lambda.function_name
}

output "post-recipe-fn-name" {
  value = module.post_lambda.function_name
}

output "put-recipe-fn-name" {
  value = module.put_lambda.function_name
}

output "delete-recipe-fn-name" {
  value = module.delete_lambda.function_name
}

output "get-recipe-id" {
  value = module.get_lambda.lambda_id
}

output "get-by-id-recipe-id" {
  value = module.get_by_id_lambda.lambda_id
}

output "post-recipe-id" {
  value = module.post_lambda.lambda_id
}

output "put-recipe-id" {
  value = module.put_lambda.lambda_id
}

output "delete-recipe-id" {
  value = module.delete_lambda.lambda_id
}

output "get-recipe-arn" {
  value = module.get_lambda.invoke_arn
}

output "get-by-id-recipe-arn" {
  value = module.get_by_id_lambda.invoke_arn
}

output "post-recipe-arn" {
  value = module.post_lambda.invoke_arn
}

output "put-recipe-arn" {
  value = module.put_lambda.invoke_arn
}

output "delete-recipe-arn" {
  value = module.delete_lambda.invoke_arn
}

output "http-api-gtw-id" {
  value = module.http_api_gateway.api_gtw_id
}

output "http-api-gtw-arn" {
  value = module.http_api_gateway.api_gtw_execution_arn
}