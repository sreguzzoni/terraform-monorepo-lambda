variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "environment" {
  description = "Name of the environment"
  type        = string
}

# function-one

variable "lambda_aws_iam_role_function_one_arn" {
  description = "The ARN related to the AWS IAM role for function_one function"
  type        = string
}

variable "function_one_name" {
  description = "Name of the function_one lambda function"
  type        = string
}