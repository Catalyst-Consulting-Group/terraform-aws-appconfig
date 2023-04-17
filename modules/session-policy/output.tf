output "arn" {
  description = "The ARN of the policy"
  value       = aws_iam_policy.this.arn
}

output "name" {
  description = "The name of the policy"
  value       = aws_iam_policy.this.name
}
