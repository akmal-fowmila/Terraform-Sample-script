resource "pingfederate_sp_idp_connection" "spIdpConnection" {
  name      = var.sp_idp_connection_name
  entity_id = var.sp_idp_connection_entity_id
  active    = true
  contact_info = {
    first_name = var.sp_idp_contact_first_name
  }
  logging_mode = "STANDARD"
  credentials = {
    certs = var.sp_idp_signing_cert_path != "" ? [
      {
        x509_file = {
          id        = var.sp_idp_signing_cert_id
          file_data = file(var.sp_idp_signing_cert_path)
        }
        encryption_cert          = false
        active_verification_cert = true
      }
    ] : []
    verification_subject_dn = var.sp_idp_signing_cert_subject_dn != "" ? var.sp_idp_signing_cert_subject_dn : null
  }

  error_page_msg_id = "errorDetail.spSsoFailure"
  idp_browser_sso = {
    protocol              = "SAML20"
    enabled_profiles      = ["IDP_INITIATED_SSO"]
    incoming_bindings     = ["POST"]
    default_target_url    = ""
    idp_identity_mapping  = "ACCOUNT_MAPPING"
    adapter_mappings = [
      {
        attribute_sources = []
        attribute_contract_fulfillment = {
          subject = {
            source = {
              type = "NO_MAPPING"
            }
          }
          "firstName" = {
            source = { type = "NO_MAPPING" }
          }
          "lastName" = {
            source = { type = "NO_MAPPING" }
          }
          "email" = {
            source = { type = "NO_MAPPING" }
          }
        }
        issuance_criteria = {
          conditional_criteria = []
        }
        restrict_virtual_entity_ids   = false
        restricted_virtual_entity_ids = []
        sp_adapter_ref = {
          id = var.sp_adapter_id
        }
      }
    ]
    authentication_policy_contract_mappings = []
    assertions_signed                       = false
    sign_authn_requests                     = false
  }
  depends_on = [
    pingfederate_sp_adapter.spAdapter
  ]
}