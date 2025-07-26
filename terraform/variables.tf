
variable "should_deploy_cloudtrail" {
  type        = string
  default     = "true"
  description = "Set to 'false' if CloudTrail is already deployed."
}

variable "should_deploy_organizations" {
  type        = string
  default     = "false"
  description = "Set to 'false' if AWS Organization is already deployed."
}

variable "should_deploy_guardduty" {
  type        = string
  default     = "false"
  description = "Set to 'false' if you do not want to deploy GuardDuty."
}

variable "admin_user_deploy" {
  type        = string
  default     = "true"
  description = "Set to 'false' if IAM Admin User is not needed."
}

variable "admin_user_name" {
  type        = string
  default     = "AdminUser"
  description = "IAM Admin User Name"
}

variable "admin_user_password" {
  type        = string
  sensitive   = true
  description = "IAM Admin User password"
}

variable "email_recipient" {
  type        = string
  default     = "lm811120@gmail.com"
  description = "Email address for root and billing alerts"
}

variable "billing_threshold" {
  type        = number
  default     = 1.0
  description = "USD threshold for billing alert"
}

variable "guardduty_email_recipient" {
  type        = string
  default     = "lm811120@gmail.com"
  description = "Email address for GuardDuty alerts"
}
