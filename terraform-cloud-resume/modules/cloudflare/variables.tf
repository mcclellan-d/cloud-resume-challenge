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


# probably need something directly from acm
# # assuming something like aws_acm_certificate.example.domain_validation_options
# variable "acm_verify_CNAME_name" {
#     type = string
# }

# variable "acm_verify_CNAME_value" {
#     type = string
# }


# if using something from
# resource "aws_route53_record" "example" {
#   for_each = {
#     for dvo in aws_acm_certificate.example.domain_validation_options : dvo.domain_name => {
#       name   = dvo.resource_record_name
#       record = dvo.resource_record_value
#       type   = dvo.resource_record_type
#     }
#   }

#   allow_overwrite = true
#   name            = each.value.name
#   records         = [each.value.record]
#   ttl             = 60
#   type            = each.value.type
#   zone_id         = data.aws_route53_zone.example.zone_id
# }