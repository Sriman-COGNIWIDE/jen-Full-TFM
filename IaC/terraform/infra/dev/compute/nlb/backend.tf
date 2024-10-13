terraform {
  backend "s3" {
    bucket         = "home-bucks-tf"
    key            = "nets-lb/nets-lb.tfstate"
    region         = "us-east-1"
    dynamodb_table = "dynamo-state-lock"
  }
}