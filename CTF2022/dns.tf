#srv1.momandpopsflags.ca
resource "cloudflare_record" "srv1" {
  depends_on = [
    aws_elb.srv1-lb
  ]
  zone_id = var.cloudflare_zone_id
  name    = "srv1"
  #  point elb to  domani name
  value = aws_elb.srv1-lb.dns_name
  type  = "CNAME"
  # ttl     = 60
}
#srv2.momandpopsflags.ca
resource "cloudflare_record" "srv2" {
  depends_on = [
    aws_elb.srv2-lb
  ]
  zone_id = var.cloudflare_zone_id
  name    = "srv2"
 #  point elb to  domani name
  value = aws_elb.srv2-lb.dns_name
  type  = "CNAME"
  # ttl     = 3600
}

#srv3.momandpopsflags.ca
resource "cloudflare_record" "srv3" {
  depends_on = [
    aws_elb.srv3-lb
  ]
  zone_id = var.cloudflare_zone_id
  name    = "srv3"
  #  point elb to  domani name
  value = aws_elb.srv3-lb.dns_name
  type  = "CNAME"
  # ttl     = 3600
}

#srv4.momandpopsflags.ca
resource "cloudflare_record" "srv4" {
  depends_on = [
    aws_elb.srv4-lb
  ]
  zone_id = var.cloudflare_zone_id
  name    = "srv4"
  #  point elb to  domani name
  value = aws_elb.srv4-lb.dns_name
  type  = "CNAME"
  # ttl     = 3600
}


## followme

#srv5.momandpopsflags.ca
resource "cloudflare_record" "srv5" {
  depends_on = [
    aws_instance.srv5
  ]
  zone_id = var.cloudflare_zone_id
  name    = "srv5"
  value = aws_instance.srv5.public_ip
  type  = "A"
  # ttl     = 3600
}

#### turn key

#vault1.momandpopsflags.ca
resource "cloudflare_record" "vault1" {
  depends_on = [
    digitalocean_loadbalancer.turn-key_0
  ]
  zone_id = var.cloudflare_zone_id
  name    = "vault1"
  value = digitalocean_loadbalancer.turn-key_0.ip
  type  = "A"
  # ttl     = 3600
}

#vault2.momandpopsflags.ca
resource "cloudflare_record" "vault2" {
  depends_on = [
    digitalocean_loadbalancer.turn-key_1
  ]
  zone_id = var.cloudflare_zone_id
  name    = "vault2"
  #  point to elb dns name
  value = digitalocean_loadbalancer.turn-key_1.ip
  type  = "A"
  # ttl     = 3600
}

#vault3.momandpopsflags.ca
resource "cloudflare_record" "vault3" {
  depends_on = [
    digitalocean_loadbalancer.turn-key_2
  ]
  zone_id = var.cloudflare_zone_id
  name    = "vault3"
  #  point to elb dns name
  value = digitalocean_loadbalancer.turn-key_2.ip
  type  = "A"
  # ttl     = 3600
}

# website dns

resource "cloudflare_record" "momandpops" {
  depends_on = [
    aws_elb.sites-lb
  ]
  zone_id = var.cloudflare_zone_id
  name    = "@"
 #  point elb to  domani name
  value = aws_elb.sites-lb.dns_name
  type  = "CNAME"
  # ttl     = 3600
}
resource "cloudflare_record" "omni" {
  depends_on = [
    aws_elb.sites-lb
  ]
  zone_id = var.omni_zone_id
  name    = "@"
 #  point elb to  domani name
  value = aws_elb.sites-lb.dns_name
  type  = "CNAME"
  # ttl     = 3600
}
