terraform {
  required_version = "~> 1.12"

  backend "local" {
    path = "../tfstate/terraform.tfstate"
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = var.aws_region
  default_tags {
    tags = var.default_resource_tags
  }
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = var.s3_bucket_name
  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_versioning" "terraform_state_versioning" {
  bucket = aws_s3_bucket.terraform_state.id

  versioning_configuration {
    status = "Enabled"
  }
}


resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state_encryption" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# https://stackoverflow.com/questions/47913041/initial-setup-of-terraform-backend-using-terraform
resource "aws_dynamodb_table" "terraform_state_lock" {
  name         = var.dynamodb_state_lock_table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}
