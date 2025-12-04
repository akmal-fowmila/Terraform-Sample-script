resource "pingfederate_authentication_policies" "authenticationPolicies" {
  fail_if_no_selection = false
  
  authn_selection_trees = [
    {
      root_node = {
        action = {
          authn_source_policy_action = {
            authentication_source = {
              type       = "IDP_ADAPTER"
              source_ref = {
                id = pingfederate_idp_adapter.html_form_adapter.id
              }
            }
            attribute_mapping = {
              attribute_sources = []
              attribute_contract_fulfillment = {
                # Map adapter attributes to policy contract attributes
                "email" = {
                  source = {
                    type = "ADAPTER"
                  }
                  value = "policy.action"
                }
                "given_name" = {
                  source = {
                    type = "ADAPTER"
                  }
                  value = "username"
                }
                "username" = {
                  source = {
                    type = "ADAPTER"
                  }
                  value = "username"
                }
              }
              issuance_criteria = {
                conditional_criteria = []
              }
            }
          }
        }
        children = [
          {
            action = {
              done_policy_action = {
                context = "Fail"
              }
            }
          },
          {
            action = {
              done_policy_action = {
                context = "Success"
              }
            }
          }
        ]
      }
      name        = var.auth_policy_name
      description = var.auth_policy_description
      enabled     = true
    }
  ]

  depends_on = [
    pingfederate_idp_adapter.html_form_adapter,
    pingfederate_authentication_policy_contract.registration
  ]
}

