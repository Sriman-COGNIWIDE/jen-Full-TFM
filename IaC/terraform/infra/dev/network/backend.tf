terraform {
  backend "s3" {
    bucket         = "home-bucks-tfs"
    key            = "nets-nw/nets-nw.tfstate"
    region         = "us-east-1"
    dynamodb_table = "state-lock"
  }
}