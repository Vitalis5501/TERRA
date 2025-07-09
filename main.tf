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
  api_url = "https://api.opsgenie.com"
}

resource "opsgenie_team" "atlantis" {
  name        = "atlantisteam"
  description = "This is a team created by Terraform."
}

resource "opsgenie_user" "example_user" {
  username  = "example_user@example.com"
  full_name = "Example User"
  timezone  = "UTC"
  role      = "User"  # Changed from user_role_id to role
}

resource "opsgenie_team_membership" "example_membership" {
  team_id = opsgenie_team.atlantis.id
  user_id = opsgenie_user.example_user.id
  role    = "user"  # Changed from "User" to "user" (lowercase)
}