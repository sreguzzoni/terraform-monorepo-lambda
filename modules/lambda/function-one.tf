resource "aws_lambda_function" "function_one" {
  filename                       = data.archive_file.function_one_source_code.output_path
  function_name                  = var.function_one_name
  source_code_hash               = data.archive_file.function_one_source_code.output_base64sha256
  handler                        = "src/index.handler"
  memory_size                    = 128
  package_type                   = "Zip"
  publish                        = true
  reserved_concurrent_executions = 1
  role                           = var.lambda_aws_iam_role_function_one_arn
  runtime                        = "nodejs18.x"
  timeout                        = 900

  environment {
    variables = {
      ENVIRONMENT = var.environment
    }
  }
}

data "archive_file" "function_one_source_code" {
  type             = "zip"
  source_dir       = "${path.root}/../lambdas/function-one/"
  excludes         = ["artifact.zip"]
  output_file_mode = "0666"
  output_path      = "${path.root}/../lambdas/function-one/artifact.zip"
}