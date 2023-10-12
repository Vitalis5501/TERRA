# Consumption_budget


| Name                       | Description                                            | Type         | Default Value | Required | Supported Values                                                                                                                                                                                                      |
|----------------------------|--------------------------------------------------------|--------------|---------------|----------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| subscription_ids         | Azure Subscription IDs                                 | map(string)  | n/a           | yes      | A mapping of budget names to their corresponding Azure Subscription IDs.                                                                                                                                           |
| cbre_consumption_budgets_config   | Map of subscription level consumption budgets to create. | map(object)  | n/a           | yes      | Each object should contain:<br> - `budget_name` (string): Name of the budget.<br> - `amount` (number): The amount of the budget.<br> - `start_date` (string): Start date in ISO 8601 format.<br> - `end_date` (string): End date in ISO 8601 format.<br> - `time_grain` (string): The time grain of the budget (e.g 'BillingAnnual' 'BillingMonth' 'BillingQuarter' 'Annually' 'Monthly' 'Quarterly' ).<br> - `notification` (map(object)): A map containing:<br>   - `enabled` (bool): Whether notifications are enabled.<br>   - `threshold` (number): The threshold value.<br>   - `threshold_type` (string): Type of threshold (e.g., 'Forecasted', 'Actual').<br>   - `operator` (string): The operator for comparison (e.g., 'GreaterThan', 'LessThan').<br>   - `contact_emails` (list(string)): List of contact emails for notifications. |
| filters                    | Additional filters for budget (Optional)              | object       | null          | no       | An optional object containing filters:<br> - `dimensions` (list(object)): A list of dimension filters where each object should contain:<br>   - `name` (string): The name of the dimension.<br>   - `values` (list(string)): List of values for the dimension filter.<br> - `tags` (list(object)): A list of tag filters where each object should contain:<br>   - `name` (string): The name of the tag.<br>   - `values` (list(string)): List of values for the tag filter. |

## Output


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

