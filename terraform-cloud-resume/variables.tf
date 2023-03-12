# --- root/variables.tf

variable "subdomain" {
  type        = string
  default     = "resume"
  description = "Just the subdomain portion of FQDN"
}

variable "domain" {
  type        = string
  default     = "mcclellan.cloud"
  description = "Just the domain portion of the FQDN"
}

variable "bucket_name" {
  type        = string
  default     = "cloudresumebucket-mcclellan"
  description = "Main bucket containing website"
}

# This will contain our terraform state
variable "terraform_bucket_name" {
  type        = string
  default     = "terraform-mcclellan-d"
  description = "Bucket to keep terraform state"
}

variable "lambda_bucket_name" {
  type        = string
  default     = "mcclellan-lambda-bucket"
  description = "Bucket to keep lambda code"
}

variable "common_tags" {
  type        = map(string)
  description = "The common tag to apply to all components"
  default = {
    Environment = "prod",
    Project     = "cloud-resume-challenge"
  }
}