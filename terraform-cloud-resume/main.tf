# --- root/main.tf



module "cloudflare" {
  source = "./modules/cloudflare"
  subdomain = var.subdomain
  domain = var.domain
  acm_tls_validation = module.acm.tls_certificate_domain_validation_options
}

module "acm" {
  source = "./modules/acm"
  subdomain = var.subdomain
  domain = var.domain
  cf_record = module.cloudflare.acm_verification_record
}





















# our version of hello world

# data "aws_ami" "server_ami" {
#   most_recent = true
#   owners      = ["099720109477"]

#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
#   }
# }



# resource "aws_instance" "app_server" {
#   ami           = data.aws_ami.server_ami.id
#   instance_type = "t2.micro"
#   tags = {
#     Name = "ExampleAppServerInstance"
#   }
# }
