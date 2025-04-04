variable "cloudflare_email" {
  type = string
}

variable "cloudflare_api_key" {
  type      = string
  sensitive = true
}

variable "cloudflare_account_id" {
  type = string
}

variable "cloudflare_homelab_zone" {
  type = string
}

variable "onepass_service_account_token" {
  type = string
  sensitive = true
}
