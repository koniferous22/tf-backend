variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "dynamodb_state_lock_table_name" {
  description = "Name of the state-locking dynamodb table"
  type        = string
}

variable "default_resource_tags" {
  type = map(string)
  description = "Default tags assigned to provisioned resources"
}
