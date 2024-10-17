data "terraform_remote_state" "nets" {
  backend = "s3"
  config = {
    bucket = "home-bucks-tfs"
    key    = "nets-nw/nets-nw.tfstate"
    region = "us-east-1"
  }
}
