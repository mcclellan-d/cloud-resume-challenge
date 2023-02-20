# --- CloudFront/outputs.tf

output "cloudfront_domain_name" {
    description = "Cloudfront distribution domain name for CNAME record with DNS provider"
    value = aws_cloudfront_distribution.s3_distribution.domain_name
}

output "cloudfront_distribution_arn" {
    description = "Cloudfront distribution ARN"
    value = aws_cloudfront_distribution.s3_distribution.arn
}