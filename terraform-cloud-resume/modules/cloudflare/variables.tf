# --- cloudflare/variables.tf

# REMOVE DEFAULTS AFTER COMPLETING RELATED MODULES

variable "subdomain" {}
variable "domain" {}
variable "acm_tls_validation" {}
# change me when CloudFront and ACM module figured out
variable "cloudfront_domain_name" {}
variable "common_tags" {}