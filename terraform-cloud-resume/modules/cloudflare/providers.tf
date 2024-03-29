# Configure the Cloudflare provider using the required_providers stanza
# required with Terraform 0.13 and beyond. You may optionally use version
# directive to prevent breaking changes occurring unannounced.
terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
}

# No longer needed with new versions of terraform
# provider "cloudflare" {
# # using env variables instead
# #  api_token = var.cloudflare_api_token
# }
