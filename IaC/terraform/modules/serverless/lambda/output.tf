output "function_name" {
  value       = aws_lambda_function.lambda_function.function_name
  description = "name of lambda function"
}

output "security_group_id" {
  value       = var.create_sg ? aws_security_group.lambda_sg[0].id : var.sg_id
  description = "lambda security group id"
}

output "role_arn" {
  value       = var.create_role ? aws_iam_role.lambda_role[0].arn : var.role_arn
  description = "lambda role arn"
}

output "layer_arn" {
  value       = var.create_layer ? aws_lambda_layer_version.lambda_layer[0].arn : var.layer_arn
  description = "lambda layer arn"
}

output "get_lambda_test_result" {
  value       = var.run_test == true ? aws_lambda_invocation.test_lambda[0].result : null
  description = "get test results"
}

output "get_by_id_lambda_test_result" {
  value       = var.run_test == true ? aws_lambda_invocation.test_lambda[0].result : null
  description = "get by id test"
}

output "post_lambda_test_result" {
  value       = var.run_test == true ? aws_lambda_invocation.test_lambda[0].result : null
  description = "post test results"
}

output "put_lambda_test_result" {
  value       = var.run_test == true ? aws_lambda_invocation.test_lambda[0].result : null
  description = "put test results"
}

output "delete_lambda_test_result" {
  value       = var.run_test == true ? aws_lambda_invocation.test_lambda[0].result : null
  description = "delete test results"
}

output "lambda_id" {
  value       = aws_lambda_function.lambda_function.id
  description = "lambda function id"
}

output "invoke_arn" {
  value       = aws_lambda_function.lambda_function.invoke_arn
  description = "lambda invoke arn"
}