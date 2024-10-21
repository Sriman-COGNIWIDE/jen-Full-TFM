output "api_gateway_url" {
  value       = var.create_api_gtw ? aws_apigatewayv2_api.http_api[0].api_endpoint : null
  description = "api gateway endpoint url"
}

output "get_recipes_url" {
  value       = "${var.create_api_gtw ? aws_apigatewayv2_api.http_api[0].api_endpoint : ""}/recipes"
  description = "get all recipes endpoint"
}

output "post_recipe_url" {
  value       = "${var.create_api_gtw ? aws_apigatewayv2_api.http_api[0].api_endpoint : ""}/recipes"
  description = "create recipe endpoint"
}

output "get_recipe_by_id_url" {
  value       = "${var.create_api_gtw ? aws_apigatewayv2_api.http_api[0].api_endpoint : ""}/recipe/1"
  description = "get single recipe endpoint"
}

output "put_recipe_url" {
  value       = "${var.create_api_gtw ? aws_apigatewayv2_api.http_api[0].api_endpoint : ""}/recipe/1"
  description = "update recipe endpoint"
}

output "delete_recipe_url" {
  value       = "${var.create_api_gtw ? aws_apigatewayv2_api.http_api[0].api_endpoint : ""}/recipe/2"
  description = "delete recipe endpoint"
}

output "api_gtw_id" {
  value       = var.create_api_gtw ? aws_apigatewayv2_api.http_api[0].id : null
  description = "api gateway id"
}

output "api_gtw_execution_arn" {
  value       = var.create_api_gtw ? aws_apigatewayv2_api.http_api[0].execution_arn : null
  description = "api execution arn"
}