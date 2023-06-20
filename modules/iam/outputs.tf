output "aws_iam_role_function_one_arn" {
  description = "The ARN related to the AWS IAM role for function_one function"
  value       = aws_iam_role.function_one.arn
}