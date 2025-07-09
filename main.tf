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

resource "opsgenie_alert_policy" "etlantis_alert" {
  message     = "Example alert from Terraform"
  description = "This alert was created via Terraform using a Team API Key."
  priority    = "P3"

  responders {
    type = "team"
    id   = "5f489b37-d2be-4a18-ac48-fd19864fb573"  
  }

  tags = ["terraform", "test"]
}


