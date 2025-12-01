resource "pingfederate_oauth_client" "azuread_oauth_client" {
  client_id = var.oauth_client_id
  name      = var.oauth_client_name

  redirect_uris = var.oauth_redirect_uris

  grant_types = [
    "AUTHORIZATION_CODE",
    "REFRESH_TOKEN"
  ]

  # Note: client_secret, scopes, and other OAuth endpoint configurations
  # are typically set via PingFederate admin UI or separate resource types.
  # The client_secret should be configured in PingFederate separately for security.
}

