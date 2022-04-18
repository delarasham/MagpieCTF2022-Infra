variable "cloudflare_api_token" {
}
#  zone id for magpiectf.ca
variable "cloudflare_zone_id" {
  type    = string
}
variable "do_token" {
  type    = string
}
variable "ssh_pvt_key" {
  type    = string
  default = "secrets/terraform_rsa"
}
variable "ssh_fingerprints" {
  type = list(string)
  default = [
    ""
  ]
}

data "digitalocean_ssh_key" "terraform" {
  name = "terraform"
}
