terraform {
  backend "s3" {
    bucket         = "home-bucks-tf"
    key            = "nets-db/nets-db.tfstate"
    region         = "us-east-1"
    dynamodb_table = "dynamo-state-lock"
  }
}