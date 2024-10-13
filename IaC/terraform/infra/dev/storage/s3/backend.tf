terraform {
  backend "s3" {
    bucket         = "home-bucks-tf"
    key            = "nets-s3/nets-s3.tfstate"
    region         = "us-east-1"
    dynamodb_table = "dynamo-state-lock"
  }
}