terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.76.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 3.4.0"
    }
  }

  required_version = "~> 1.5.0"
}
