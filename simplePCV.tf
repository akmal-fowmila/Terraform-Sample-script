
resource "pingfederate_password_credential_validator" "simple_pcv" {
  validator_id = var.pcv_id
  name         = "My Terraform Simple PCV"
  
  plugin_descriptor_ref = {
    id = "org.sourceid.saml20.domain.SimpleUsernamePasswordCredentialValidator"
  }

  attribute_contract = {}

  configuration = {
    tables = [
      {
        name = "Users"
        rows = [
          {
            sensitive_fields = [
              { name = "Username", value = "testuser" },
              { name = "Password", value = "Lms@12345" }, # Change this if you like
              { name = "Confirm Password", value = "Lms@12345" }
            ]
          }
        ]
      }
    ]
  }
}