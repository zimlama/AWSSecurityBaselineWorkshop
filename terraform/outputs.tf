
output "iam_signin_url" {
  description = "IAM User Sign-In URL"
  value       = "https://${data.aws_caller_identity.current.account_id}.signin.aws.amazon.com/console"
}

data "aws_caller_identity" "current" {}
