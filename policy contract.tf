resource "pingfederate_authentication_policy_contract" "registration" {
  contract_id = "registrationContract"
  name        = "User Registration Contract"
  
  # Attributes required by your fragment logic
  extended_attributes = [
    { name = "email" },
    { name = "username" }
  ]

}
