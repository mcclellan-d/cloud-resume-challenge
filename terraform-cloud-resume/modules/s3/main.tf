# --- S3/main.tf

# this is for 'content_type' which we probably don't need
# this breaks things if you don't have all the mime types
locals {
  mime_types = {
    htm  = "text/html"
    html = "text/html"
    css  = "text/css"
    ttf  = "font/ttf"
    js   = "application/javascript"
    map  = "application/javascript"
    json = "application/json"
    png  = "image/png"
    md = "text/markdown"
    xml = "text/xml"
    ico = "image/x-icon"
  }
}

# S3 bucket for web
resource "aws_s3_bucket" "web_bucket" {
  bucket = var.bucket_name
  tags = var.common_tags
}

# # ACLs are depracated... probably don't need this
# resource "aws_s3_bucket_acl" "b_acl" {
#   bucket = aws_s3_bucket.web_bucket.id
#   acl    = "private"
# }

# Apply bucket policy
resource "aws_s3_bucket_policy" "apply_s3_b_policy" {
  bucket = aws_s3_bucket.web_bucket.id
  policy = data.aws_iam_policy_document.s3_b_policy.json
}

# Data for bucket policy
data "aws_iam_policy_document" "s3_b_policy" {
  statement {
    actions = ["s3:GetObject"]

    resources = ["${aws_s3_bucket.web_bucket.arn}/*"]

    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }
    condition {
      test = "StringEquals"
      variable = "AWS:SourceARN"
      values = [var.cloudfront_distribution_arn]
    }
  }
}

# Upload latest resume to s3 bucket
# might separate web into different repo
resource "aws_s3_object" "upload_static_web_files" {
  for_each = fileset("${path.module}/../../../website/","**")
  bucket = aws_s3_bucket.web_bucket.id
  key = each.value
  source = "${path.module}/../../../website/${each.value}"
  etag = filemd5("${path.module}/../../../website/${each.value}")
  content_type = lookup(local.mime_types, split(".", each.value)[length(split(".", each.value)) - 1])
}


resource "aws_s3_bucket_public_access_block" "block" {
  bucket                  = aws_s3_bucket.web_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}