# --- root/main.tf

module "acm" {
  source = "./modules/acm"
  subdomain = var.subdomain
  domain = var.domain
  cf_record = module.cloudflare.acm_verification_record
  common_tags = var.common_tags
}

module "cloudflare" {
  source = "./modules/cloudflare"
  subdomain = var.subdomain
  domain = var.domain
  acm_tls_validation = module.acm.tls_certificate_domain_validation_options
  cloudfront_domain_name = module.cloudfront.cloudfront_domain_name
  common_tags = var.common_tags
}


# integration with cloudfront is enough to warrant combining these
# module "s3" {
#   source = "./modules/s3"
#   # cloudfront = module.cloudfront.thing.stuff.arn
#   bucket_name = var.bucket_name
# }

module "cloudfront" {
  source = "./modules/cloudfront"
  bucket_name = var.bucket_name
  subdomain = var.subdomain
  domain = var.domain
  common_tags = var.common_tags
  tlscert_arn = module.acm.tlscert_arn
}