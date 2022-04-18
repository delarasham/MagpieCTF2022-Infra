## written by James Lowther and Jeremy Stuart

resource "digitalocean_droplet" "turn-key_0" {
  image    = "debian-10-x64"
  name     = "turn-key-0"
  region   = "sfo3"
  size     = "s-1vcpu-1gb"
  ssh_keys = [""]
  tags     = ["turn-key-0"]
  count    = 1
  lifecycle {
    create_before_destroy = true
  }
  connection {
    host        = self.ipv4_address
    user        = "root"
    type        = "ssh"
    private_key = file("secrets/id_rsa")
    timeout     = "2m" 
  }
  provisioner "file" {
    source      = "compose/turn-key-docker-compose.yml"
    destination = "/root/docker-compose.yml"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get -y install docker docker-compose pass",
      "docker login -u ${var.do_container_registry_token} -p ${var.do_container_registry_token} registry.digitalocean.com",
      "export SERVER_NUMBER=0",
      "export NUMBER_OF_SERVERS=3",
      "export KEY_PERIOD=${var.key_period}",
      "export PROTOCOL_TIME=${var.protocol_time}",
      "docker-compose -f /root/docker-compose.yml up -d",
      "exit 0"
    ]
  }
}

resource "digitalocean_droplet" "turn-key_1" {
  image    = "debian-10-x64"
  name     = "turn-key-1"
  region   = "blr1"
  size     = "s-1vcpu-1gb"
  ssh_keys = [""]
  tags     = ["turn-key-1"]
  count    = 1
  lifecycle {
    create_before_destroy = true
  }
  connection {
    host        = self.ipv4_address
    user        = "root"
    type        = "ssh"
    private_key = file("secrets/id_rsa")
    timeout     = "2m"
  }
  provisioner "file" {
    source      = "compose/turn-key-docker-compose.yml"
    destination = "/root/docker-compose.yml"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get -y install docker docker-compose pass",
      "docker login -u ${var.do_container_registry_token} -p ${var.do_container_registry_token} registry.digitalocean.com",
      "export SERVER_NUMBER=1",
      "export NUMBER_OF_SERVERS=3",
      "export KEY_PERIOD=${var.key_period}",
      "export PROTOCOL_TIME=${var.protocol_time}",
      "docker-compose -f /root/docker-compose.yml up -d",
      "exit 0"
    ]
  }
}

resource "digitalocean_droplet" "turn-key_2" {
  image    = "debian-10-x64"
  name     = "turn-key-2"
  region   = "ams3"
  size     = "s-1vcpu-1gb"
  ssh_keys = [""]
  tags     = ["turn-key-2"]
  count    = 1
  lifecycle {
    create_before_destroy = true
  }
  connection {
    host        = self.ipv4_address
    user        = "root"
    type        = "ssh"
    private_key = file("secrets/id_rsa")
    timeout     = "2m"
  }
  provisioner "file" {
    source      = "compose/turn-key-docker-compose.yml"
    destination = "/root/docker-compose.yml"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get -y install docker docker-compose pass",
      "docker login -u ${var.do_container_registry_token} -p ${var.do_container_registry_token} registry.digitalocean.com",
      "export SERVER_NUMBER=2",
      "export NUMBER_OF_SERVERS=3",
      "export KEY_PERIOD=${var.key_period}",
      "export PROTOCOL_TIME=${var.protocol_time}",
      "docker-compose -f /root/docker-compose.yml up -d",
      "exit 0"
    ]
  }
}
