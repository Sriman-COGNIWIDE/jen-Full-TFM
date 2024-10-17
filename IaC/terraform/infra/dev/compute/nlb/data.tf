data "terraform_remote_state" "nets" {
  backend = "s3"
  config = {
    bucket = "home-bucks-tfs"
    key    = "nets-nw/nets-nw.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "vms" {
  backend = "s3"
  config = {
    bucket = "home-bucks-tfs"
    key    = "nets-ec2/nets-ec2.tfstate"
    region = "us-east-1"
  }
}

