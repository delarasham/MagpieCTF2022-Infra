terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.0"
    }
  }
}
provider "digitalocean" {
  token = var.do_token
}
provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

#  ctfd project
data "digitalocean_project" "CTFd" {
  name = "CTFd"
}

resource "digitalocean_project_resources" "ctfd-prod-resources" {
  project = data.digitalocean_project.CTFd.id
  resources = concat(
      digitalocean_droplet.ctfd-prod.*.urn,
      [
      digitalocean_loadbalancer.ctfd-prod-lb.urn,

    ]
  )

}
