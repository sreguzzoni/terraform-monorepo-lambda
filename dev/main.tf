terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "us-east-1" # set up your region
}

locals {
  aws_region    = "us-east-1" # set up your region
  environment   = "dev"
  platform_name = "MY_PLATFORM" # set up your platform name
}

module "MY_PLATFORM-lambdas" {
  source = "../modules"

  project_name      = "${local.platform_name}-lambdas"
  environment       = local.environment
  function_one_name = "${local.platform_name}-function-one-${local.environment}"
}