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

locals {
  schedules = yamldecode(file("${path.module}/schedules.yaml"))
}

resource "opsgenie_schedule" "dynamic_schedules" {
  for_each = {
    for schedule in local.schedules.schedules : schedule.name => schedule
  }

  name        = each.value.name
  description = each.value.description
  timezone    = each.value.timezone
  enabled     = each.value.enabled
  owner_team_id = each.value.owner_team_id
}
