data "terraform_remote_state" "nets" {
  backend = "s3"
  config = {
    bucket = "home-bucks-tf"
    key    = "nets-nw/nets-nw.tfstate"
    region = "us-east-1"
  }
}

data "aws_secretsmanager_secret" "db_credentials" {
  name = "db_creds"
}

data "aws_secretsmanager_secret_version" "db_credentials" {
  secret_id = data.aws_secretsmanager_secret.db_credentials.id
}

