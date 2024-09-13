provider "aws" {
  region = "us-east-1"
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

terraform {
  backend "s3" {
    bucket         = var.bucket
    key            = "env/${var.environment}/terraform.tfstate" # Use different keys for prod and staging
    region         = "us-east-1"
    dynamodb_table = "cloudfairy-to-do-app-terraform-lock"
    encrypt        = true
  }
}
