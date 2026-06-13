terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5.20.0"
    }

    http = {
      source  = "hashicorp/http"
      version = "~> 3.6.0"
    }

    random = {
      source  = "hashicorp/random"
    }
  }
}

provider "cloudflare" {
  email   = var.cloudflare_email
  api_key = var.cloudflare_api_key
}
