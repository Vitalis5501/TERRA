# Consumption_budget


## Overview

This Terraform module creates Azure consumption budgets at the subscription levels.

## Features

- Creates consumption budgets for resource groups.
- Supports customizing budget amounts, start and end dates, and notification thresholds.
  
## Inputs

| Name                       | Description                                            | Type         | Default Value | Required | Supported Values                                                                                                                                                                                                      |
|----------------------------|--------------------------------------------------------|--------------|---------------|----------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| subscription_ids         | Azure Subscription IDs                                 | map(string)  | n/a           | yes      | A mapping of budget names to their corresponding Azure Subscription IDs.                                                                                                                                           |
| cbre_consumption_budgets_config   | Map of subscription level consumption budgets to create. | map(object)  | n/a           | yes      | Each object should contain:<br> - `budget_name` (string): Name of the budget.<br> - `amount` (number): The amount of the budget.<br> - `start_date` (string): Start date in ISO 8601 format.<br> - `end_date` (string): End date in ISO 8601 format.<br> - `time_grain` (string): The time grain of the budget (e.g 'BillingAnnual' 'BillingMonth' 'BillingQuarter' 'Annually' 'Monthly' 'Quarterly' ).<br> - `notification` (map(object)): A map containing:<br>   - `enabled` (bool): Whether notifications are enabled.<br>   - `threshold` (number): The threshold value.<br>   - `threshold_type` (string): Type of threshold (e.g., 'Forecasted', 'Actual').<br>   - `operator` (string): The operator for comparison (e.g., 'GreaterThan', 'LessThan').<br>   - `contact_emails` (list(string)): List of contact emails for notifications. |

## Output
| Name                       | Description                       |
|----------------------------|-----------------------------------|
| consumption_budget_ids    | List of Consumption Budget IDs     |

## Usage

```hcl
module "cbre_consumption_budgets" {
  source = ""

  subscription_ids = {
    budget1 = "/subscriptions/6119437a-7edd-4b6b-9eb1-9b1a7d1b7a7e",
    budget2 = "/subscriptions/6119437a-7edd-4b6b-9eb1-9b1a7d1b7a7e",
    # Add more subscriptions as needed
  }

  cbre_consumption_budgets_config = {
    budget1 = {
      budget_name = "sirjarvis_Budget"
      amount      = 1000
      start_date  = "2023-10-01T00:00:00Z"
      end_date    = "2023-12-01T00:00:00Z"
      time_grain  = "BillingMonth"
      notification = {
        forecasted = {
          enabled        = true
          threshold      = 80
          threshold_type = "Forecasted"
          operator       = "GreaterThan"
          contact_emails = ["avisoftcloud@gmail.com"]
        }
        actual = {
          enabled        = true
          threshold      = 90
          threshold_type = "Actual"
          operator       = "GreaterThan"
          contact_emails = ["nonso@gmail.com"]
        }
      }
    },
    budget2 = {
      budget_name = "testBudget2"
      amount      = 1500
      start_date  = "2023-09-01T00:00:00Z"
      end_date    = "2023-11-01T00:00:00Z"
      time_grain  = "BillingMonth"
      notification = {
        forecasted = {
          enabled        = true
          threshold      = 75
          threshold_type = "Forecasted"
          operator       = "GreaterThan"
          contact_emails = ["avisoftcloud@gmail.com"]
        }
        actual = {
          enabled        = true
          threshold      = 85
          threshold_type = "Actual"
          operator       = "GreaterThan"
          contact_emails = ["nonso@gmail.com"]
        }
      }
    },
    # Add more budgets as needed
  }
}
output "budget_ids" {
  value = module.cbre_consumption_budgets.consumption_budget_ids
}
