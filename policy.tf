resource "pingfederate_authentication_policies" "auth_policies" {
  fail_if_no_selection = false

  authn_selection_trees = [
    {
      name        = "Dynamic AuthN Policy"
      description = "Routes traffic based on 'AuthN_Experience' Extended Property."
      enabled     = true

      root_node = {
        action = {
          authn_selector_policy_action = {
            authentication_selector_ref = { id = pingfederate_authentication_selector.authnexp.id }
          }
        }

        children = [
          {
            action = {
              authn_selector_policy_action = {
                authentication_selector_ref = { id = pingfederate_authentication_selector.authnexp.id }
                context = "AuthN_Experience"
              }
            }
            children = [
              {
                action = {
                  authn_selector_policy_action = {
                    authentication_selector_ref = { id = pingfederate_authentication_selector.authnexp.id }
                    context = "Registration"
                  }
                }
                children = [
                  {
                    action = {
                      fragment_policy_action = {
                        fragment = { id = pingfederate_authentication_policies_fragment.registration_fragment.id }
                        fragment_mapping = {
                          attribute_sources = []
                          attribute_contract_fulfillment = {
                            "given_name"  = { source = { type = "NO_MAPPING" } }
                            "family_name" = { source = { type = "NO_MAPPING" } }
                            "firstName"   = { source = { type = "NO_MAPPING" } }
                            "lastName"    = { source = { type = "NO_MAPPING" } }
                            "username"    = { source = { type = "NO_MAPPING" } }
                            "subject"     = { source = { type = "NO_MAPPING" } }
                            "email"       = { source = { type = "NO_MAPPING" } }
                            "fullName"    = { source = { type = "NO_MAPPING" } }
                            "photo"       = { source = { type = "NO_MAPPING" } }
                          }
                          issuance_criteria = { conditional_criteria = [] }
                        }
                      }
                    }
                    children = [
                      { action = { done_policy_action = { context = "Fail" } } },
                      { action = { done_policy_action = { context = "Success" } } }
                    ]
                  }
                ]
              }
            ]
          }
        ]
      }
    }
  ]
}