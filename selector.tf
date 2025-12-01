resource "pingfederate_extended_properties" "auth_experience" {
  items = [
    {
      name         = "AuthN_Experience"
      description  = "Authentication Experience Property"
      multi_valued = false
    }
  ]
}

resource "pingfederate_authentication_selector" "authnexp" {
  selector_id = var.selector_id
  name        = "Selector - Extended Property"
  
  plugin_descriptor_ref = {
    id = "com.pingidentity.pf.selectors.ExtendedPropertyAuthnSelector"
  }

  configuration = {
    fields = [
      {
        name  = "Extended Property"
        value = "AuthN_Experience"
      }
    ]
  }

  attribute_contract = {
    extended_attributes = [
      {
        name = "AuthN_Experience"
      }
    ]
  }

  depends_on = [
    pingfederate_extended_properties.auth_experience
  ]
}