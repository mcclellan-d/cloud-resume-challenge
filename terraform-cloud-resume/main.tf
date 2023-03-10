# --- root/main.tf

module "acm" {
  source = "./modules/acm"
  subdomain = var.subdomain
  domain = var.domain
  cf_record = module.cloudflare.acm_verification_record
  common_tags = var.common_tags
}

module "apigateway" {
  source = "./modules/apigateway"
  common_tags = var.common_tags
  lambda_invoke_arns = module.lambda.lambda_invoke_arns
  }

module "cloudflare" {
  source = "./modules/cloudflare"
  subdomain = var.subdomain
  domain = var.domain
  acm_tls_validation = module.acm.tls_certificate_domain_validation_options
  cloudfront_domain_name = module.cloudfront.cloudfront_domain_name
  common_tags = var.common_tags
}

module "cloudfront" {
  source = "./modules/cloudfront"
  b_regional_domain_name = module.s3.b_regional_domain_name
  subdomain = var.subdomain
  domain = var.domain
  common_tags = var.common_tags
  tlscert_arn = module.acm.tlscert_arn
}

module "dynamodb" {
  source = "./modules/dynamodb"
  common_tags = var.common_tags
}

module "lambda" {
  source = "./modules/lambda"
  common_tags = var.common_tags
  #b_web_bucket_id =  module.s3.b_web_bucket_id
  lambda_bucket = var.lambda_bucket_name
  countDBtable_arn = module.dynamodb.countDBtable_arn
}

module "s3" {
  source = "./modules/s3"
  # cloudfront = module.cloudfront.thing.stuff.arn
  bucket_name = var.bucket_name
  common_tags = var.common_tags
  cloudfront_distribution_arn = module.cloudfront.cloudfront_distribution_arn
}