terraform {
  backend "s3" {
    bucket         = "home-bucks-tf"
    key            = "nets-lambda/nets-lambda.tfstate"
    region         = "us-east-1"
    dynamodb_table = "dynamo-state-lock"
  }
}