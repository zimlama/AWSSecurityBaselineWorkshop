
provider "aws" {
  region = "us-east-1"
}

resource "aws_budgets_budget" "billing" {
  name              = "BillingBudget"
  budget_type       = "COST"
  time_unit         = "MONTHLY"

  limit_amount      = var.billing_threshold
  limit_unit        = "USD"

  notification {
    comparison_operator = "GREATER_THAN"
    notification_type   = "ACTUAL"
    threshold           = var.billing_threshold
    threshold_type      = "PERCENTAGE"

    subscriber {
      address          = var.email_recipient
      subscription_type = "EMAIL"
    }
  }
}

resource "aws_iam_group" "admin_group" {
  name = "AdminGroup"
}

resource "aws_iam_group_policy_attachment" "admin_group_attach" {
  group      = aws_iam_group.admin_group.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_user" "admin_user" {
  count    = var.admin_user_deploy == "true" ? 1 : 0
  name     = var.admin_user_name
  force_destroy = true

  login_profile {
    password_reset_required = true
    password                = var.admin_user_password
  }
}

resource "aws_iam_user_group_membership" "admin_membership" {
  count = var.admin_user_deploy == "true" ? 1 : 0
  user  = aws_iam_user.admin_user[0].name
  groups = [aws_iam_group.admin_group.name]
}

resource "aws_organizations_organization" "org" {
  count       = var.should_deploy_organizations == "true" ? 1 : 0
  feature_set = "ALL"
}

resource "aws_guardduty_detector" "this" {
  count  = var.should_deploy_guardduty == "true" ? 1 : 0
  enable = true
}
