resource "aws_lambda_function" "lambda_function" {
  function_name = var.function_name
  role          = var.create_role ? aws_iam_role.lambda_role[0].arn : var.role_arn
  handler       = "${var.function_name}.lambda_handler"
  runtime       = var.runtime
  s3_bucket     = var.s3_bucket
  s3_key        = var.s3_key
  timeout       = 60

  vpc_config {
    subnet_ids         = [var.subnet_1_id, var.subnet_2_id]
    security_group_ids = var.create_sg ? [aws_security_group.lambda_sg[0].id] : [var.sg_id]
  }

  environment {
    variables = {
      DB_HOST     = var.db_host
      DB_PORT     = var.db_port
      DB_NAME     = var.db_name
      DB_USER     = var.db_username
      DB_PASSWORD = var.db_password
    }
  }

  layers = var.create_layer ? [aws_lambda_layer_version.lambda_layer[0].arn] : [var.layer_arn]
}

resource "aws_security_group" "lambda_sg" {
  count  = var.create_sg ? 1 : 0
  name   = var.sg_name
  vpc_id = var.vpc_id
}

resource "aws_security_group_rule" "lambda_to_rds" {
  count                    = var.create_sg ? 1 : 0
  type                     = "egress"
  from_port                = 5432
  to_port                  = 5432
  protocol                 = "tcp"
  source_security_group_id = var.rds_sg
  security_group_id        = aws_security_group.lambda_sg[0].id
}

resource "aws_security_group_rule" "rds_from_lambda" {
  count                    = var.create_sg ? 1 : 0
  type                     = "ingress"
  from_port                = 5432
  to_port                  = 5432
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.lambda_sg[0].id
  security_group_id        = var.rds_sg
}

resource "aws_iam_role" "lambda_role" {
  count = var.create_role ? 1 : 0
  name  = var.role_name

  assume_role_policy = var.policy
}

resource "aws_iam_role_policy_attachment" "lambda_vpc_access" {
  count      = var.create_role && var.add_policy_arns ? length(var.policy_arns) : 0
  role       = aws_iam_role.lambda_role[0].name
  policy_arn = var.policy_arns[count.index]
  depends_on = [aws_iam_role.lambda_role[0]]
}

resource "aws_lambda_layer_version" "lambda_layer" {
  count               = var.create_layer ? 1 : 0
  layer_name          = var.layer_name
  s3_bucket           = var.s3_bucket
  s3_key              = var.layer_s3_key
  compatible_runtimes = [var.runtime]
}

resource "aws_lambda_invocation" "test_lambda" {
  count         = var.run_test == true ? 1 : 0
  function_name = aws_lambda_function.lambda_function.function_name
  input         = file(var.payload_file)

  depends_on = [aws_lambda_function.lambda_function]
}
