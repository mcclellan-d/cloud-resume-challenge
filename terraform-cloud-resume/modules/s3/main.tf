# --- S3/main.tf


# Due to the close integration with cloudfront, bucket creation will remain in that module.

# resource "aws_s3_bucket" "web_bucket" {
#   bucket = var.bucket_name
# }
