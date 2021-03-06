resource "digitalocean_loadbalancer" "ctfd-prod-lb" {
  name                   = "ctfd-prod-lb"
  region                 = "sfo3"
  redirect_http_to_https = true
  forwarding_rule {
    entry_port     = 80
    entry_protocol = "http"

    target_port     = 80
    target_protocol = "http"
  }
  forwarding_rule {
    entry_port     = 9101
    entry_protocol = "http"

    target_port     = 9101
    target_protocol = "http"
  }
  forwarding_rule {
    entry_port     = 443
    entry_protocol = "https"

    target_port     = 443
    target_protocol = "https"
    tls_passthrough = true
  }
  healthcheck {
    port     = 22
    protocol = "tcp"
  }
  sticky_sessions {
    type               = "cookies"
    cookie_name        = "session-id"
    cookie_ttl_seconds = 300
  }

  droplet_tag =  "ctfd-prod"
}
output "loadbalancer-ip" {
  value = digitalocean_loadbalancer.ctfd-prod-lb.ip
}