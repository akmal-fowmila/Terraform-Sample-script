
terraform {
  required_providers {
    pingfederate = {
      source  = "pingidentity/pingfederate"
      # Pinning to a specific version range prevents
      # breaking changes from new provider releases [12, 18]
      version = "~> 1.6.0"
    }
  }
}