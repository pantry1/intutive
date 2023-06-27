terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.1.0"
    }

    local = {
      source  = "hashicorp/local"
      version = "2.1.0"
    }

  }
  required_version = "~> 1.4.6"
}

