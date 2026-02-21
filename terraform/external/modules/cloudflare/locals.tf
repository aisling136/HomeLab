locals {
  cloudflared_credentials = "{\"AccountTag\":\"${var.cloudflare_account_id}\",\"TunnelName\":\"${cloudflare_zero_trust_tunnel_cloudflared.homelab_tunnel.name}\",\"TunnelID\":\"${cloudflare_zero_trust_tunnel_cloudflared.homelab_tunnel.id}\",\"TunnelSecret\":\"${random_password.tunnel_secret.result}\"}"
}
