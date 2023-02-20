# --- S3/outputs.tf

output "b_regional_domain_name" {
  value = aws_s3_bucket.web_bucket.bucket_regional_domain_name
}

