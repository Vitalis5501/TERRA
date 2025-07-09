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

resource "opsgenie_alert_policy" "test" {
  name               = "example policy"
  team_id            = "5f489b37-d2be-4a18-ac48-fd19864fb573"
  policy_description = "This is sample policy"
  message            = "{{message}}"

  time_restriction {
    type = "weekday-and-time-of-day"

    restrictions {
      start_day  = "sunday"
      start_hour = 21
      start_min  = 0
      end_day    = "monday"
      end_hour   = 7
      end_min    = 0
    }

    restrictions {
      start_day  = "monday"
      start_hour = 22
      start_min  = 0
      end_day    = "tuesday"
      end_hour   = 7
      end_min    = 0
    }
  }
}


