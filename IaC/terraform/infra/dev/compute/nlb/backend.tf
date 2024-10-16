terraform {
  backend "s3" {
    bucket         = "home-bucks-tfs"
    key            = "nets-lb/nets-lb.tfstate"
    region         = "us-east-1"
    dynamodb_table = "state-lock"
  }
}