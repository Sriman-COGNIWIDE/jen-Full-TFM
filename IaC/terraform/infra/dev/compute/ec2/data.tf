data "terraform_remote_state" "nets" {
  backend = "s3"
  config = {
    bucket = "home-bucks-tf"
    key    = "nets-nw/nets-nw.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "vms" {
  backend = "s3"
  config = {
    bucket = "home-bucks-tf"
    key    = "nets-ec2/nets-ec2.tfstate"
    region = "us-east-1"
  }
}


data "http" "myip" {
  url = "https://ipv4.icanhazip.com"
}

data "aws_ami" "amznlinux2023" {
  most_recent = true // specific region is not needed bcoz it is done in the provider block
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "description"
    values = ["Amazon Linux 2023 AMI*"]
  }
}

//ami-0fff1b9a61dec8a5f

data "aws_s3_object" "recipe-app" {
  bucket = "lambda-codes-zip"
  key    = "prj.py"
}