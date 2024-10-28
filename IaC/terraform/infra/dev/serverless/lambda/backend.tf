terraform {
  backend "s3" {
    bucket         = "tf-prj-recipe"
    key            = "recipe-serverless/serverless.tfstate"
    region         = "us-east-1"
    dynamodb_table = "tf-prj-recipe"
  }
}