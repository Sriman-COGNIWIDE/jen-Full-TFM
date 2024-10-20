data "terraform_remote_state" "nets" {
  backend = "s3"
  config = {
    bucket = "tf-prj-recipe"
    key    = "networks/networks.tfstate"
    region = "us-east-1"
  }
}

data "http" "myip" {
  url = "http://checkip.amazonaws.com"
}