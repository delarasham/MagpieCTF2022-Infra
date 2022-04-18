resource "digitalocean_droplet" "ctfd-prod" {
  image  = "ubuntu-20-04-x64"
  name   = "ctfd-prod"
  region = "sfo3"
  # size     = "s-2vcpu-2gb"
  size     = "c-4"
  # size = "c-8"
  # size = "c-2"
  ssh_keys = concat([data.digitalocean_ssh_key.terraform.id], var.ssh_fingerprints)
  tags     = ["ctfd-prod"]
  count    = 2
  lifecycle {
    create_before_destroy = true
  }
  connection {
    host        = self.ipv4_address
    user        = "root"
    type        = "ssh"
    private_key = file(var.ssh_pvt_key)
    timeout     = "2m"
  }
  provisioner "file" {
    source      = "./files"
    destination = "/root/files"
  }
  user_data = file("scripts/script.sh")
  backups = true
}
output "droplet-ip" {
  value = digitalocean_droplet.ctfd-prod.*.ipv4_address
}
