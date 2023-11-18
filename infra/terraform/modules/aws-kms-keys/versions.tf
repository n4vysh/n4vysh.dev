terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      version               = "~> 5.26.0"
      configuration_aliases = [aws.secondary]
    }
  }

  required_version = "~> 1.1.7"
}
