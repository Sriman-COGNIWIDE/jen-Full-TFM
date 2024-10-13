
resource "aws_apigatewayv2_api" "http_api" {
  count         = var.create_api_gtw == true ? 1 : 0
  name          = var.api_gtw_name
  protocol_type = var.protocol
}

resource "aws_apigatewayv2_stage" "default" {
  count       = var.create_api_gtw == true ? 1 : 0
  api_id      = aws_apigatewayv2_api.http_api[0].id
  name        = var.stage_name
  auto_deploy = true
}

resource "aws_apigatewayv2_integration" "lambda_integration" {
  count            = var.create_integration == true ? 1 : 0
  api_id           = var.api_gtw_id
  integration_type = "AWS_PROXY" //learn abt other integ types
  integration_uri  = var.lambda_invoke_arn

}

resource "aws_apigatewayv2_route" "gtw_lamb_route" {
  count     = var.create_integration == true ? 1 : 0
  api_id    = var.api_gtw_id
  route_key = var.lambda_route_key
  target    = "integrations/${aws_apigatewayv2_integration.lambda_integration[0].id}"
}

resource "aws_lambda_permission" "api_gtw_permission" {
  count         = var.create_integration == true ? 1 : 0
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${var.api_gtw_arn}/*/*"
}