resource "pingfederate_idp_sp_connection" "samlSpBrowserSSOExample" {
  connection_id      = var.connection_id
  name               = var.connection_name
  entity_id          = var.partner_entity_id
  active             = true
  contact_info       = {}
  base_url           = var.partner_acs_url
  logging_mode       = "STANDARD"
  virtual_entity_ids = []
  credentials = {
    certs = []
    signing_settings = {
      signing_key_pair_ref = {
        id = var.signing_key_id
      }
      include_raw_key_in_signature = false
      include_cert_in_signature    = false
      algorithm                    = "SHA256withRSA"
    }

  }
  sp_browser_sso = {
    protocol                      = "SAML20"
    require_signed_authn_requests = false
    sp_saml_identity_mapping      = "STANDARD"
    sign_assertions               = false
    adapter_mappings = [
      {
        idp_adapter_ref = {
          id = var.adapter_id
        }
        attribute_sources = []
        attribute_contract_fulfillment = {
          "SAML_SUBJECT" = {
            source = {
              type = "ADAPTER"
            }
          }
        }
        issuance_criteria = {
          conditional_criteria = []
          }
          attribute_contract_fulfillment = {
            "SAML_SUBJECT" = {
              source = {
                type = "ADAPTER"
              }
              value = "username"
            }
        }
      }
    ]
    authentication_policy_contract_assertion_mappings = []
    encryption_policy = {
      encrypt_slo_subject_name_id   = false
      encrypt_assertion             = false
      encrypted_attributes          = []
      slo_subject_name_id_encrypted = false
    }
    enabled_profiles = [
      "IDP_INITIATED_SSO"
    ]
    sign_response_as_required = true
    sso_service_endpoints = [
      {
        is_default = true
        binding    = "POST"
        index      = 0
        url        = "https://google.com"
      }
    ]
    assertion_lifetime = {
      minutes_after  = 5
      minutes_before = 5
    }
    attribute_contract = {
      core_attributes = [
        {
          name_format = "urn:oasis:names:tc:SAML:1.1:nameid-format:unspecified",
          name        = "SAML_SUBJECT"
        }
      ]
      extended_attributes = []
    }
  }
}
