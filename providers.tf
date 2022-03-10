terraform {

  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }

  }
}

# Configure the AWS Provider
provider "aws" {
  region     = var.region
  access_key = "AKIAQRD5N5R7YHQ5UUFD"
  secret_key = "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"

  default_tags {
    tags = {
      Provisioned-By = "Pete"
      Environment    = var.environment
      Terraform      = true
    }
  }

}
