# 2022.magpiectf.ca
resource "cloudflare_record" "ctfd-prod" {
  zone_id         = var.cloudflare_zone_id
  type            = "A"
  name            = "2022"
  value           = digitalocean_loadbalancer.ctfd-prod-lb.ip
  # ttl     = 300
}
