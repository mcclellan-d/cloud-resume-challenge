# --- acm/outputs.tf

output "cert_validation_certificate_arn" {
  description = "The ARN of the certificate that is being validated."
  value = aws_acm_certificate_validation.cert_validation.certificate_arn
}

output "tls_certificate_domain_validation_options" {
  description = "AWS ACM TLS certificate option to use to validate domain"
  value = aws_acm_certificate.tls_certificate.domain_validation_options
}