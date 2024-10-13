module "get_lambda" {
  source        = "../../../../modules/serverless/lambda"
  create_sg     = true
  create_layer  = true
  create_role   = true
  function_name = "GET-recipe"
  runtime       = "python3.12"
  s3_bucket     = "lambda-codes-zip"
  s3_key        = "GET-recipe.zip"
  sg_name       = "lambda_sg"
  layer_name    = "lamb-layer"
  layer_s3_key  = "lambda_function.zip"
  role_name     = "lambda_role"

  rds_sg      = data.terraform_remote_state.dbs.outputs.rds_security_group_id
  vpc_id      = data.terraform_remote_state.nets.outputs.net_b_id
  subnet_1_id = data.terraform_remote_state.nets.outputs.db_subnet_1
  subnet_2_id = data.terraform_remote_state.nets.outputs.db_subnet_2

  db_password = sensitive(local.lambda_creds.db_password)
  db_host     = local.lambda_creds.db_host
  db_port     = local.lambda_creds.db_port
  db_name     = local.lambda_creds.db_name
  db_username = sensitive(local.lambda_creds.db_username)

  payload = jsonencode({
    httpMethod = "GET"
    path       = "/recipes"
    headers = {
      "Content-Type" = "application/json"
    }
    queryStringParameters = {}
    body                  = null
  })

  run_test = false
}

module "get_by_id_lambda" {
  source = "../../../../modules/serverless/lambda"

  function_name = "GET-by-id-recipe"
  runtime       = "python3.12"
  s3_bucket     = "lambda-codes-zip"
  s3_key        = "GET-by-id-recipe.zip"

  sg_id     = module.get_lambda.security_group_id
  role_arn  = module.get_lambda.role_arn
  layer_arn = module.get_lambda.layer_arn

  subnet_1_id = data.terraform_remote_state.nets.outputs.db_subnet_1
  subnet_2_id = data.terraform_remote_state.nets.outputs.db_subnet_2

  db_password = sensitive(local.lambda_creds.db_password)
  db_host     = local.lambda_creds.db_host
  db_port     = local.lambda_creds.db_port
  db_name     = local.lambda_creds.db_name
  db_username = sensitive(local.lambda_creds.db_username)

  payload = jsonencode({
    httpMethod = "GET"
    path       = "/recipe/2"
    headers = {
      "Content-Type" = "application/json"
    }
  })

  run_test = false
}

module "post_lambda" {
  source = "../../../../modules/serverless/lambda"

  function_name = "POST-recipe"
  runtime       = "python3.12"
  s3_bucket     = "lambda-codes-zip"
  s3_key        = "POST-recipe.zip"

  sg_id     = module.get_lambda.security_group_id
  role_arn  = module.get_lambda.role_arn
  layer_arn = module.get_lambda.layer_arn

  subnet_1_id = data.terraform_remote_state.nets.outputs.db_subnet_1
  subnet_2_id = data.terraform_remote_state.nets.outputs.db_subnet_2

  db_password = sensitive(local.lambda_creds.db_password)
  db_host     = local.lambda_creds.db_host
  db_port     = local.lambda_creds.db_port
  db_name     = local.lambda_creds.db_name
  db_username = sensitive(local.lambda_creds.db_username)

  payload = jsonencode({
    httpMethod = "POST"
    path       = "/recipes"
    headers = {
      "Content-Type" = "application/json"
    }
    body = "{\"name\": \"jigarthanda\", \"description\": \"A classic southern drink.\"}"
  })

  run_test = false
}

module "put_lambda" {
  source = "../../../../modules/serverless/lambda"

  function_name = "PUT-recipe"
  runtime       = "python3.12"
  s3_bucket     = "lambda-codes-zip"
  s3_key        = "PUT-recipe.zip"

  sg_id     = module.get_lambda.security_group_id
  role_arn  = module.get_lambda.role_arn
  layer_arn = module.get_lambda.layer_arn

  subnet_1_id = data.terraform_remote_state.nets.outputs.db_subnet_1
  subnet_2_id = data.terraform_remote_state.nets.outputs.db_subnet_2

  db_password = sensitive(local.lambda_creds.db_password)
  db_host     = local.lambda_creds.db_host
  db_port     = local.lambda_creds.db_port
  db_name     = local.lambda_creds.db_name
  db_username = sensitive(local.lambda_creds.db_username)

  payload = jsonencode({
    httpMethod = "PUT"
    path       = "/recipe/8"
    headers = {
      "Content-Type" = "application/json"
    }
    body = "{\"name\": \"Spaghetti \", \"description\": \"My fav.\"}"
  })

  run_test = false
}

module "delete_lambda" {
  source = "../../../../modules/serverless/lambda"

  function_name = "DELETE-recipe"
  runtime       = "python3.12"
  s3_bucket     = "lambda-codes-zip"
  s3_key        = "DELETE-recipe.zip"

  sg_id     = module.get_lambda.security_group_id
  role_arn  = module.get_lambda.role_arn
  layer_arn = module.get_lambda.layer_arn

  subnet_1_id = data.terraform_remote_state.nets.outputs.db_subnet_1
  subnet_2_id = data.terraform_remote_state.nets.outputs.db_subnet_2

  db_password = sensitive(local.lambda_creds.db_password)
  db_host     = local.lambda_creds.db_host
  db_port     = local.lambda_creds.db_port
  db_name     = local.lambda_creds.db_name
  db_username = sensitive(local.lambda_creds.db_username)

  payload = jsonencode({
    httpMethod = "DELETE"
    path       = "/recipe/2"
    headers = {
      "Content-Type" = "application/json"
    }
  })

  run_test = false
}

module "http_api_gateway" {
  source = "../../../../modules/serverless/api-gtw"

  create_api_gtw = true
  api_gtw_name   = "http-api-gtw"
  protocol       = "HTTP"
}

module "get_lambda_inegration" {
  source = "../../../../modules/serverless/api-gtw"

  create_integration   = true
  lambda_invoke_arn    = module.get_lambda.invoke_arn
  lambda_route_key     = "GET /recipes"
  lambda_function_name = module.get_lambda.function_name
  api_gtw_id           = module.http_api_gateway.api_gtw_id
  api_gtw_arn          = module.http_api_gateway.api_gtw_execution_arn

  depends_on = [module.http_api_gateway]

}

module "get_by_id_lambda_inegration" {
  source = "../../../../modules/serverless/api-gtw"

  create_integration   = true
  lambda_invoke_arn    = module.get_by_id_lambda.invoke_arn
  lambda_route_key     = "GET /recipe/{id}"
  lambda_function_name = module.get_by_id_lambda.function_name
  api_gtw_id           = module.http_api_gateway.api_gtw_id
  api_gtw_arn          = module.http_api_gateway.api_gtw_execution_arn

  depends_on = [module.http_api_gateway]

}

module "post_lambda_inegration" {
  source = "../../../../modules/serverless/api-gtw"

  create_integration   = true
  lambda_invoke_arn    = module.post_lambda.invoke_arn
  lambda_route_key     = "POST /recipes"
  lambda_function_name = module.post_lambda.function_name
  api_gtw_id           = module.http_api_gateway.api_gtw_id
  api_gtw_arn          = module.http_api_gateway.api_gtw_execution_arn

  depends_on = [module.http_api_gateway]

}

module "put_lambda_inegration" {
  source = "../../../../modules/serverless/api-gtw"

  create_integration   = true
  lambda_invoke_arn    = module.put_lambda.invoke_arn
  lambda_route_key     = "PUT /recipe/{id}"
  lambda_function_name = module.put_lambda.function_name
  api_gtw_id           = module.http_api_gateway.api_gtw_id
  api_gtw_arn          = module.http_api_gateway.api_gtw_execution_arn

  depends_on = [module.http_api_gateway]

}

module "delete_lambda_inegration" {
  source = "../../../../modules/serverless/api-gtw"

  create_integration   = true
  lambda_invoke_arn    = module.delete_lambda.invoke_arn
  lambda_route_key     = "DELETE /recipe/{id}"
  lambda_function_name = module.delete_lambda.function_name
  api_gtw_id           = module.http_api_gateway.api_gtw_id
  api_gtw_arn          = module.http_api_gateway.api_gtw_execution_arn

  depends_on = [module.http_api_gateway]

}