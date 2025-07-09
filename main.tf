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
resource "opsgenie_schedule" "test" {
  name        = "atlantisgenieschedule"
  description = "schedule test"
  timezone    = "Europe/Rome"
  enabled     = false
}

resource "opsgenie_schedule" "atlantis_schedule" {
  name          = "atlantis_genieschedule"
  description   = "schedule test"
  timezone      = "Europe/Rome"
  enabled       = false
  owner_team_id = "5f489b37-d2be-4a18-ac48-fd19864fb573"
}