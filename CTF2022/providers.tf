terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.0"
    }
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}
provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}
provider "cloudflare" {
  api_token = var.cloudflare_api_token
}
#  turn key configs
data "digitalocean_project" "turn-key" {
  name = "turn-key"
}
resource "digitalocean_project_resources" "turn-key-resources" {
  project = data.digitalocean_project.turn-key.id
  resources = concat(
      digitalocean_droplet.turn-key_0.*.urn,
      digitalocean_droplet.turn-key_1.*.urn,
      digitalocean_droplet.turn-key_2.*.urn,
      [
      digitalocean_loadbalancer.turn-key_0.urn,
      digitalocean_loadbalancer.turn-key_1.urn,
      digitalocean_loadbalancer.turn-key_2.urn
    ]
  )

}

provider "digitalocean" {
  token = var.do_token
}