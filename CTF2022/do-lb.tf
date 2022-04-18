resource "digitalocean_loadbalancer" "turn-key_0" {
  name   = "lb-0"
  region = "sfo3"
  forwarding_rule {
    entry_port     = 5555
    entry_protocol = "tcp"

    target_port     = 5555
    target_protocol = "tcp"
  }
  sticky_sessions {
    type               = "cookies"
    cookie_name        = "session-id"
    cookie_ttl_seconds = 300
  }

  healthcheck {
    port     = 22
    protocol = "tcp"
  }

  droplet_tag = "turn-key-0"
}
resource "digitalocean_loadbalancer" "turn-key_1" {
  name   = "lb-1"
  region = "blr1"

  forwarding_rule {
    entry_port     = 5555
    entry_protocol = "tcp"

    target_port     = 5555
    target_protocol = "tcp"
  }


  sticky_sessions {
    type               = "cookies"
    cookie_name        = "session-id"
    cookie_ttl_seconds = 300
  }

  healthcheck {
    port     = 22
    protocol = "tcp"
  }

  droplet_tag = "turn-key-1"
}
resource "digitalocean_loadbalancer" "turn-key_2" {
  name   = "lb-2"
  region = "ams3"

  forwarding_rule {
    entry_port     = 5555
    entry_protocol = "tcp"

    target_port     = 5555
    target_protocol = "tcp"
  }

  sticky_sessions {
    type               = "cookies"
    cookie_name        = "session-id"
    cookie_ttl_seconds = 300
  }

  healthcheck {
    port     = 22
    protocol = "tcp"
  }

  droplet_tag = "turn-key-2"
}