# --- root/variables.tf

variable "subdomain" {
  type    = string
  default = "test"
  description = "Just the subdomain portion of FQDN"
}

variable "domain" {
  type    = string
  default = "0x00.link"
  description = "Just the domain portion of the FQDN"
}

variable "bucket_name" {
  type = string
  default = "cloudresumebucket-mcclellan"
  description = "Main bucket containing website"
}

# This will contain our terraform state
variable "terraform_bucket_name" {
  type = string
  default = "terraform-mcclellan-d"
  description = "Bucket to keep terraform state"
}

variable "common_tags" {
  type = map(string)
  description = "The common tag to apply to all components"
  default = {
    Environment = "dev",
    Project = "cloud-resume-challenge"
}
}