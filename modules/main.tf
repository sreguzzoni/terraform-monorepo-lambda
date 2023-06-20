module "iam" {
  source = "./iam"

  project_name                  = var.project_name
  environment                   = var.environment
  function_one_name             = var.function_one_name
}

module "lambda" {
  source = "./lambda"

  project_name = var.project_name
  environment  = var.environment

  function_one_name                    = var.function_one_name
  lambda_aws_iam_role_function_one_arn = module.iam.aws_iam_role_function_one_arn
}