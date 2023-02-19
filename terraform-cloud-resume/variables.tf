# --- root/variables.tf

variable "subdomain" {
  type    = string
  default = "test"
}

variable "domain" {
  type    = string
  default = "0x00.link"
}

variable "bucket_name" {
  type = string
  default = "cloudresumebucket-mcclellan"
}

# This will contain our terraform state
variable "terraform_bucket_name" {
  type = string
  default = "terraform-mcclellan-d"
}