terraform {
  backend "s3" {
    bucket         = "home-bucks-tfs"
    key            = "nets-lambda/nets-lambda.tfstate"
    region         = "us-east-1"
    dynamodb_table = "state-lock"
  }
}