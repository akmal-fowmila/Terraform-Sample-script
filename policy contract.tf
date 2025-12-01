resource "pingfederate_authentication_policy_contract" "registration" {
  contract_id = "registrationContract"
  name        = "User Registration Contract"
  
  # Attributes required by your fragment logic
  extended_attributes = [
    { name = "email" },
    { name = "given_name" },
    { name = "family_name" },
    { name = "firstName" },
    { name = "lastName" },
    { name = "fullName" },
    { name = "photo" },
    { name = "username" }
  ]
}