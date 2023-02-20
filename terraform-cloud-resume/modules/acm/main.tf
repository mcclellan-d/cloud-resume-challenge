# --- acm/main.tf

resource "aws_acm_certificate" "tls_certificate" {
  domain_name       = "${var.subdomain}.${var.domain}"
  validation_method = "DNS"

  tags = var.common_tags

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate_validation" "cert_validation" {
  certificate_arn = aws_acm_certificate.tls_certificate.arn
  validation_record_fqdns = var.cf_record
}