module "cloudflare" {
    source = "./modules/cloudflare"
    cloudflare_account_id = var.cloudflare_account_id
    cloudflare_email = var.cloudflare_email
    cloudflare_api_key = var.cloudflare_api_key
    cloudflare_homelab_zone = var.cloudflare_homelab_zone
    cloudflare_second_zone = var.cloudflare_second_zone
    allowed_ip_range = var.allowed_ip_range
}

module "onepass" {
    source = "./modules/onepass"
    cloudflare_api_token = module.cloudflare.api_token
    onepass_service_account_token = var.onepass_service_account_token
    cloudflared_credentials = module.cloudflare.cloudflared_credentials
}
