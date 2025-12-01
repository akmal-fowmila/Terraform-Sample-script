resource "pingfederate_authentication_policies_fragment" "registration_fragment" {
  name        = "Registration"
  description = "Sample Registration Fragment"
  fragment_id = "registrationFragment"

  
  inputs = {
    id = pingfederate_authentication_policy_contract.registration.id
  }

  outputs = {
    id = pingfederate_authentication_policy_contract.registration.id
  }

  
  root_node = {
    action = {
      authn_source_policy_action = {
        # 1. Call Your Specific HTML Form Adapter
        authentication_source = {
          type = "IDP_ADAPTER"
          source_ref = {
            id = pingfederate_idp_adapter.html_form_adapter.id
          }
        }
        
        input_user_id_mapping = {
          source = {
            type = "INPUTS"
            id   = "Inputs"
          }
          value = "username"
        }
        user_id_authenticated = true
      }
    }


    children = [
      # CHILD 1: FAIL PATH
      {
        action = {
          done_policy_action = {
            context = "Fail"
          }
        }
      },
      
      # CHILD 2: SUCCESS PATH
      {
        action = {
          apc_mapping_policy_action = {
            context = "Success"
            
            # Reference the Policy Contract
            authentication_policy_contract_ref = {
              id = pingfederate_authentication_policy_contract.registration.id
            }

            # Map attributes from Adapter -> Policy Contract
            attribute_mapping = {
              attribute_sources = []
              
              attribute_contract_fulfillment = {
                # --- 1. Mapped from Adapter ---
                "subject" = {
                  source = {
                    type = "ADAPTER"
                    id   = pingfederate_idp_adapter.html_form_adapter.id
                  }
                  value = "username"
                }

                "username" = {
                  source = {
                    type = "ADAPTER"
                    id   = pingfederate_idp_adapter.html_form_adapter.id
                  }
                  value = "username"
                }

                
                "firstName" = {
                  source = { type = "TEXT" }
                  value  = "Unknown"
                }

                "lastName" = {
                  source = { type = "TEXT" }
                  value  = "Unknown"
                }

                "given_name" = {
                  source = { type = "TEXT" }
                  value  = "Unknown"
                }

                "family_name" = {
                  source = { type = "TEXT" }
                  value  = "Unknown"
                }

                "email" = {
                   source = { type = "TEXT" }
                   value  = "no-email@example.com"
                }

                "fullName" = {
                   source = { type = "TEXT" }
                   value  = "User"
                }

                "photo" = {
                   source = { type = "TEXT" }
                   value  = "placeholder" 
                }
              }
            }
          }
        }
      }
    ]
  }
}