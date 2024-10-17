terraform {
  backend "s3" {
    bucket         = "home-bucks-tfs"
    key            = "nets-s3/nets-s3.tfstate"
    region         = "us-east-1"
    dynamodb_table = "state-lock"
  }
}