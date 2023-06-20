locals {
  function_one_log_group_name = "/aws/lambda/${var.function_one_name}"
}

resource "aws_iam_role" "function_one" {
  assume_role_policy = jsonencode(
    {
      Statement = [
        {
          Action = "sts:AssumeRole"
          Effect = "Allow"
          Principal = {
            Service = [
              "lambda.amazonaws.com",
              "edgelambda.amazonaws.com"
            ]
          }
        },
      ]
      Version = "2012-10-17"
    }
  )
  managed_policy_arns = [
    aws_iam_policy.function_one.arn,
  ]
  max_session_duration = 3600
}

resource "random_uuid" "function_one_iam_policy" {}

resource "aws_iam_policy" "function_one" {
  name   = "${var.function_one_name}-policy-${random_uuid.function_one_iam_policy.result}"
  policy = data.aws_iam_policy_document.function_one.json

  lifecycle {
    create_before_destroy = true
  }
}

data "aws_iam_policy_document" "function_one" {
  version = "2012-10-17"

  statement {
    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]
    effect = "Allow"
    resources = [
      "arn:aws:logs:*:${data.aws_caller_identity.function_one.account_id}:log-group:${local.function_one_log_group_name}:*"
    ]
  }

  statement {
    actions = [
      "logs:CreateLogGroup"
    ]
    effect = "Allow"
    resources = [
      "arn:aws:logs:*:${data.aws_caller_identity.function_one.account_id}:*"
    ]
  }

}

data "aws_caller_identity" "function_one" {}
