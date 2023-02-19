# --- cloudflare/outputs.tf

output "acm_verification_record" {
  description = "We need this output to give ACM validation_record_fqdns"
  value = [for record in cloudflare_record.acm_verification_record : record.hostname ]
}