# variables.tf
# Declares all input variables for the project.

# --- Provider Connection Variables ---
variable "pf_host" {
  type        = string
  description = "The HTTPS URL of the PingFederate Admin API (e.g., https://pingfed.example.com:9999)"
}

variable "pf_version" {
  type        = string
  description = "The product version of your PingFederate server (e.g., '12.3')"
}

variable "pf_username" {
  type        = string
  description = "The admin username for the PingFederate API."
  sensitive   = true
}

variable "pf_password" {
  type        = string
  description = "The admin password for the PingFederate API."
  sensitive   = true
}

variable "signing_key_id" {
  type        = string
  description = "The ID of the signing key, found in the PF admin console."
}

variable "connection_id" {
  type        = string
  description = "The unique string ID for this connection."
  # default     = "my-idp-connection"
}

variable "connection_name" {
  type        = string
  description = "The display name for this new IdP connection."
  # default     = "MyNewTerraformSPConnection"
}

variable "partner_entity_id" {
  type        = string
  description = "The SAML Entity ID of the Service Provider (SP) you are connecting to."
}

variable "partner_acs_url" {
  type        = string
  description = "The Assertion Consumer Service (ACS) URL for the partner SP."
}

# --- NEW: IdP Adapter Variables ---

variable "pcv_id" {
  type        = string
  description = "The ID for the Password Credential Validator."
  # default     = "mySimplePCV"
}

variable "adapter_id" {
  type        = string
  description = "The ID for the HTML Form IdP Adapter."
  # default     = "myHtmlFormAdapter"
}

variable "adapter_name" {
  type        = string
  description = "The friendly name for the HTML Form Adapter."
  # default     = "My Terraform HTML Form Adapter"
}

# --- SP Adapter / OpenToken variables ---
variable "sp_adapter_id" {
  type        = string
  description = "The ID for the SP OpenToken Adapter."
  # default     = "myOpenTokenAdapter"
}

variable "sp_adapter_name" {
  type        = string
  description = "The friendly name for the SP OpenToken Adapter."
  # default     = "My OpenToken Adapter"
}

variable "opentoken_sp_adapter_password" {
  type        = string
  description = "Password used in the OpenToken SP Adapter configuration."
  sensitive   = true
  # default     = "ChangeMe123!"
}

# ---IdP Connection Variables ---
variable "sp_idp_connection_name" {
  type        = string
  description = "The display name for the SP-to-IdP connection."
  # default     = "My SP-to-IdP Connection"
}

variable "sp_idp_connection_entity_id" {
  type        = string
  description = "The SAML Entity ID for this SP-to-IdP connection."
  # default     = "my-sp-entity-id"
}

variable "sp_idp_contact_first_name" {
  type        = string
  description = "Contact first name for the SP-to-IdP connection."
  # default     = "Admin"
}

# Signing certificate for the IdP (used to verify IdP signatures)
variable "sp_idp_signing_cert_id" {
  type        = string
  description = "Logical ID used for the IdP signing certificate resource in PingFederate."
}

variable "sp_idp_signing_cert_path" {
  type        = string
  description = "Local file path to the IdP signing certificate (PEM/crt)."
}

variable "sp_idp_signing_cert_subject_dn" {
  type        = string
  description = "Subject DN of an existing PingFederate certificate to use for verification (when cert is in PF)."
  # default     = "CN=pfx-server.example.com, OU=IT, O=ExampleCorp, C=US"
}

# --- OAuth Client Variables  ---
variable "oauth_client_id" {
  type        = string
  description = "OAuth client ID registered in PingFederate."
}

variable "oauth_client_secret" {
  type        = string
  description = "OAuth client secret (sensitive)."
  sensitive   = true
}

variable "oauth_client_name" {
  type        = string
  description = "Display name for the OAuth client."
}

variable "oauth_redirect_uris" {
  type        = list(string)
  description = "List of redirect URIs for the OAuth client (e.g., callback endpoints)."
  # default     = ["https://pingfederate.example.com/oauth/callback"]
}

variable "oauth_scopes" {
  type        = string
  description = "Space-separated list of OAuth scopes to request (e.g., 'openid profile email')."
  default     = "openid profile email"
}

# --- Selector Variables ---
variable "extended_property_name" {
  type        = string
  description = "The name of the Custom Extended Property to create in PF."
}

variable "selector_id" {
  type        = string
  description = "The ID for the Authentication Selector."
}

#----Fragment Variables-----
variable "fragment_internal_id" {
  type        = string
  description = "ID for the Internal users fragment."
}

variable "fragment_first_factor_id" {
  type        = string
  description = "ID for the First Factor fragment."
}

#---- Policy Contract Variables -----
variable "policy_contract_id" {
  type        = string
  description = "The ID for the Authentication Policy Contract."
}

variable "policy_contract_name" {
  type        = string
  description = "The display name for the Authentication Policy Contract."
}

#---- Authentication Policy Variables -----
variable "auth_policy_name" {
  type        = string
  description = "The name of the authentication policy."
}

variable "auth_policy_description" {
  type        = string
  description = "The description of the authentication policy."
}

