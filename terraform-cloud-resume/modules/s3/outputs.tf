# --- S3/outputs.tf

output "s3_bucket" {
  value = aws_s3_bucket.web_bucket.arn
}

