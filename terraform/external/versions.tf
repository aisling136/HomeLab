terraform {
  required_version = "~> 1.9.0"

  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "dexterslab"

    workspaces {
      name = "homelab-external"
    }
  }

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5.15.0"
    }

    http = {
      source  = "hashicorp/http"
      version = "~> 3.5.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.8.0"
    }

    onepassword = {
      source = "1Password/onepassword"
      version = "~> 3.1.0"
    }
  }
}

provider "cloudflare" {
  email   = var.cloudflare_email
  api_key = var.cloudflare_api_key
}

provider "random" {
}

provider "onepassword" {
  service_account_token = var.onepass_service_account_token
}
