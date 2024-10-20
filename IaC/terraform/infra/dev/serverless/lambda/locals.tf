locals {
  lambda_creds = jsondecode(data.aws_secretsmanager_secret_version.lambda_credentials.secret_string)
}