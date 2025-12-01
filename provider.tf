provider "pingfederate" {
  username = var.pf_username
  password = var.pf_password
  https_host = var.pf_host
  product_version = var.pf_version

  # For testing with self-signed certificates.
  # Remove this for production environments.
  insecure_trust_all_tls = true 
}