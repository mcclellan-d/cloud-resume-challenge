# --- cloudflare/variables.tf

# REMOVE DEFAULTS AFTER COMPLETING RELATED MODULES

variable "subdomain" {}
variable "domain" {}
variable "acm_tls_validation" {}
# change me when CloudFront and ACM module figured out
variable "aws_cloudfront_endpoint" {
    type = string
    default = "test.mcclellan.cloud.s3-website-us-east-1.amazonaws.com"
}
