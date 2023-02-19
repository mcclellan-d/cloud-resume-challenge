https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs

Debating on adding this feature to the deployment...

```s
# Configure the Cloudflare provider using the required_providers stanza
# required with Terraform 0.13 and beyond. You may optionally use version
# directive to prevent breaking changes occurring unannounced.
terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.0"
    }
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

# Create a record
resource "cloudflare_record" "www" {
  # ...
}

# Create a page rule
resource "cloudflare_page_rule" "www" {
  # ...
}
```

# Example of possible record option



```s
# Add a record to the domain
resource "cloudflare_record" "example" {
  zone_id = var.cloudflare_zone_id
  name    = "terraform"
  value   = "192.0.2.1"
  type    = "A"
  ttl     = 3600
}

# Add a record requiring a data map
resource "cloudflare_record" "_sip_tls" {
  zone_id = var.cloudflare_zone_id
  name    = "_sip._tls"
  type    = "SRV"

  data {
    service  = "_sip"
    proto    = "_tls"
    name     = "terraform-srv"
    priority = 0
    weight   = 0
    port     = 443
    target   = "example.com"
  }
}
```

What we might want
```s
# Add a record to the domain
resource "cloudflare_record" "example" {
  zone_id = var.cloudflare_zone_id
  # likely need just the subdomain portion of the url to create a record for the FQDN
  name    = var.subdomain
  # this should be our cloudfront Distribution domain name (e.g: dx6z3rb2mWc6.cloudfront.net)
  value   = aws_cloudfront_distribution.website_bucket.hosted_zone_id
  type    = "CNAME"
  ttl     = 3600
}
```
