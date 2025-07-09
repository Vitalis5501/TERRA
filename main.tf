terraform {
  required_providers {
    opsgenie = {
      source  = "opsgenie/opsgenie"
      version = "~> 0.6.37"
    }
  }
}

provider "opsgenie" {
  api_key = var.opsgenie_api_key
  api_url = "api.opsgenie.com"
}

resource "opsgenie_user" "example_user" {
  username  = "example_user@example.com"
  full_name = "Example User"
  timezone  = "UTC"
  role      = "User"
}

resource "opsgenie_team" "atlantis" {
  name        = "atlantisteam"
  description = "This is a team created by Terraform."
  
  member {
    id   = opsgenie_user.example_user.id
    role = "user"
  }
}