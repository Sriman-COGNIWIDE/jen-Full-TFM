terraform {
  backend "s3" {
    bucket         = "home-bucks-tfs"
    key            = "nets-peer/nets-peer.tfstate"
    region         = "us-east-1"
    dynamodb_table = "state-lock"
  }
}