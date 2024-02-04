output "state_bucket_name" {
  description = "Name of the S3 bucket used to store tf backend"
  value = aws_s3_bucket.terraform_state.id
}

output "state_lock_dynamodb_table" {
  description = "DynamoDB table used for state locking"
  value = aws_dynamodb_table.terraform_state_lock.id
}
