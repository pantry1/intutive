resource "aws_s3_bucket" "my_bucket" {
  bucket = "aws-cicd-gha"
  acl    = "private"

  versioning {
    enabled = true
    mfa_delete = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  logging {
    target_bucket = "aws-cicd-gha"  # Replace with your desired log bucket
    target_prefix = "logs/"
  }
}

resource "aws_s3_bucket_public_access_block" "my_bucket_block_public_access" {
  bucket = aws_s3_bucket.my_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
