terraform {
  backend "s3" {
    bucket                  = "terraform-bucket-v1"
    key                     = "terraform.tfstate"
    region                  = "us-east-1"
    encrypt                 = false
    dynamodb_table          = "terraform-state-lock"
    shared_credentials_file = "./configs/aws/credentials"
    profile                 = "terraform"
  }
}