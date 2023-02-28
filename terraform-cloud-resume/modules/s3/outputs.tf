# --- S3/outputs.tf

output "b_regional_domain_name" {
  value = aws_s3_bucket.web_bucket.bucket_regional_domain_name
}

output "b_web_bucket_id" {
  value = aws_s3_bucket.web_bucket.id
}