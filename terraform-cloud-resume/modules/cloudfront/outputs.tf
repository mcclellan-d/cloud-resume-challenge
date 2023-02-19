# --- CloudFront/outputs.tf

output "cloudfront_domain_name" {
    description = "CloudFront distribution domain name for CNAME record with DNS provider"
    value = aws_cloudfront_distribution.s3_distribution.domain_name
}