output "api_gateway_url" {
  value = var.create_api_gtw ? aws_apigatewayv2_api.http_api[0].api_endpoint : null
}

output "get_recipes_url" {
  value = "${var.create_api_gtw ? aws_apigatewayv2_api.http_api[0].api_endpoint : ""}/recipes"
}

output "post_recipe_url" {
  value = "${var.create_api_gtw ? aws_apigatewayv2_api.http_api[0].api_endpoint : ""}/recipes"
}

output "get_recipe_by_id_url" {
  value = "${var.create_api_gtw ? aws_apigatewayv2_api.http_api[0].api_endpoint : ""}/recipe/1"
}

output "put_recipe_url" {
  value = "${var.create_api_gtw ? aws_apigatewayv2_api.http_api[0].api_endpoint : ""}/recipe/1"
}

output "delete_recipe_url" {
  value = "${var.create_api_gtw ? aws_apigatewayv2_api.http_api[0].api_endpoint : ""}/recipe/2"
}

output "api_gtw_id" {
  value = var.create_api_gtw ? aws_apigatewayv2_api.http_api[0].id : null
}

output "api_gtw_execution_arn" {
  value = var.create_api_gtw ? aws_apigatewayv2_api.http_api[0].execution_arn : null
}

