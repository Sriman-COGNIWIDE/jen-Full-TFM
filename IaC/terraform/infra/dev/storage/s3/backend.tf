terraform {
  backend "s3" {
    bucket         = "tf-prj-recipe"
    key            = "storage/s3.tfstate"
    region         = "us-east-1"
    dynamodb_table = "tf-prj-recipe"
  }
}