#User
output "iam_user_arn" {
  description = "ARN of IAM user"
  value       = aws_iam_user.this.arn
}

#Group
output "iam_group_arn" {
  description = "ARN of admin IAM role"
  value       = aws_iam_group.this.arn
}

#User
output "iam_role_arn" {
  description = "ARN of admin IAM role"
  value       = aws_iam_role.this.arn
}