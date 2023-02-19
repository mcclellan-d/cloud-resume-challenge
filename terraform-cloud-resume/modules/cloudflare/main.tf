# --- cloudflare/main.tf

data "cloudflare_zone" "this" {
  name = var.domain
}

resource "cloudflare_record" "web" {
  zone_id = data.cloudflare_zone.this.id
  name    = var.subdomain
  value   = var.aws_cloudfront_endpoint
  type    = "CNAME"
  ttl     = 3600
}


resource "cloudflare_record" "acm_verification_record" {
  zone_id         = data.cloudflare_zone.this.id
  allow_overwrite = true
  proxied         = true
  name            = each.value.name
  type            = "CNAME"
  value           = each.value.record
  ttl             = 1
}

# resource "cloudflare_record" "acm_verification_record" {
#   for_each = {
#     for item in var.acm_tls_validation : item.domain_name => {
#       name   = item.resource_record_name
#       record = item.resource_record_value
#       type   = item.resource_record_type
#     }
#   }

#   zone_id         = data.cloudflare_zone.this.id
#   allow_overwrite = true
#   proxied         = true
#   name            = each.value.name
#   type            = each.value.type
#   value           = each.value.record
#   ttl             = 1
# }



# # We need to create a record CNAME record for validating our domain with ACM
# resource "cloudflare_record" "acm_verification_record" {
#   zone_id = data.cloudflare_zone.this.id
#   name    = "validatething"
#   value   = "validatevalue"
#   type    = "CNAME"
#   ttl     = 3600
# # This might not be entirely correct

# }

