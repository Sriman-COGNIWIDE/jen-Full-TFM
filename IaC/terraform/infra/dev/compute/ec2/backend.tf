terraform {
  backend "s3" {
    bucket         = "home-bucks-tfs"
    key            = "nets-ec2/nets-ec2.tfstate"
    region         = "us-east-1"
    dynamodb_table = "state-lock"
  }
}