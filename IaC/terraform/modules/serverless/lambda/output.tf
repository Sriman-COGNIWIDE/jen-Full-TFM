# output "api_gateway_url" {
#   value = aws_apigatewayv2_api.http_api.api_endpoint
# }

# output "get_recipes_url" {
#   value = "${aws_apigatewayv2_api.http_api.api_endpoint}/recipes"
# }

# output "post_recipe_url" {
#   value = "${aws_apigatewayv2_api.http_api.api_endpoint}/recipes"
# }

# output "get_recipe_by_id_url" {
#   value = "${aws_apigatewayv2_api.http_api.api_endpoint}/recipe/{id}"
# }

# output "put_recipe_url" {
#   value = "${aws_apigatewayv2_api.http_api.api_endpoint}/recipe/{id}"
# }

# output "delete_recipe_url" {
#   value = "${aws_apigatewayv2_api.http_api.api_endpoint}/recipe/{id}"
# }

output "function_name" {
  value = aws_lambda_function.lambda_function.function_name
}

output "security_group_id" {
  value = var.create_sg ? aws_security_group.lambda_sg[0].id : var.sg_id
}

output "role_arn" {
  value = var.create_role ? aws_iam_role.lambda_role[0].arn : var.role_arn
}

output "layer_arn" {
  value = var.create_layer ? aws_lambda_layer_version.lambda_layer[0].arn : var.layer_arn
}

output "get_lambda_test_result" {
  value = var.run_test == true ? aws_lambda_invocation.test_lambda[0].result : null
}

output "get_by_id_lambda_test_result" {
  value = var.run_test == true ? aws_lambda_invocation.test_lambda[0].result : null
}

output "post_lambda_test_result" {
  value = var.run_test == true ? aws_lambda_invocation.test_lambda[0].result : null
}

output "put_lambda_test_result" {
  value = var.run_test == true ? aws_lambda_invocation.test_lambda[0].result : null
}

output "delete_lambda_test_result" {
  value = var.run_test == true ? aws_lambda_invocation.test_lambda[0].result : null
}

output "lambda_id" {
  value = aws_lambda_function.lambda_function.id
}

output "invoke_arn" {
  value = aws_lambda_function.lambda_function.invoke_arn
}

