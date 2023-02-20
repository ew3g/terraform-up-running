provider "aws" {
  region = "us-east-2"
}

# Bucket to store the terraform's state files
resource "aws_s3_bucket" "terraform-state" {
  bucket = "terraform-up-and-running-state-my-test-edilson"

  # Prevent accidental deletion of this S3 bucket
  # lifecycle {
  #   prevent_destroy = true
  # }
}

# Enable server-side encryption by default
# The data stored in th bucket is encrypted
resource "aws_s3_bucket_server_side_encryption_configuration" "terraform-state-encryption" {
  bucket = aws_s3_bucket.terraform-state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Enable versioning so we can see the full reviosion history of our
# state files
# When we change some file, S3 creates a file with the older version
resource "aws_s3_bucket_versioning" "terraform-state-versioning" {
  bucket = aws_s3_bucket.terraform-state.id

  versioning_configuration {
    status = "Enabled"
  }
}

# DynamoDB table used for locking when we run terraform apply
resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-up-and-running-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
