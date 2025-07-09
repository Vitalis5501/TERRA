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
  # Optional, depending on region
  # api_url = "https://api.opsgenie.com"
}

resource "opsgenie_team" "example_team" {
  name        = "ExampleTeam"
  description = "This is a team created by Terraform."
}

resource "opsgenie_user" "example_user" {
  username    = "example_user@example.com"
  full_name   = "Example User"
  role        = "User"
  user_role   = "User"
  timezone    = "UTC"

  # Optional: assign to the team
  teams = [opsgenie_team.example_team.id]
}
