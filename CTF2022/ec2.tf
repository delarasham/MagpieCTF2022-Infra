# ec2 instance for server 1
resource "aws_instance" "srv1" {
  ami                    = var.ubuntu_ami
  instance_type          = var.instance_type
  availability_zone      = element(var.azs, count.index)
  key_name               = var.aws_instance_key
  count                  = length(var.subnets_cidr_srv1)
  # count = 0
  vpc_security_group_ids = [aws_security_group.allow-all.id]
  subnet_id              = element(aws_subnet.public-srv1.*.id, count.index)
  iam_instance_profile   = aws_iam_instance_profile.ctf2022-profile.name
  provisioner "file" {
    source      = "compose/srv1-docker-compose.yml"
    destination = "~/docker-compose.yml"
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("./secrets/ctf2022-key.pem")
      host        = self.public_ip
    }
  }
  user_data = file("./scripts/script.sh")
  tags = {
    Name = "srv1-index${count.index}"
  }
}
# ec2 instance for server 2
resource "aws_instance" "srv2" {
  ami               = var.ubuntu_ami
  instance_type     = var.instance_type
  availability_zone = element(var.azs, count.index)
  key_name          = var.aws_instance_key
  count                  = length(var.subnets_cidr_srv2)
  # count = 0
  vpc_security_group_ids = [aws_security_group.allow-all.id]
  subnet_id              = element(aws_subnet.public-srv2.*.id, count.index)
  iam_instance_profile   = aws_iam_instance_profile.ctf2022-profile.name
  provisioner "file" {
    source      = "compose/srv2-docker-compose.yml"
    destination = "/home/ubuntu/docker-compose.yml"
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("./secrets/ctf2022-key.pem")
      host        = self.public_ip
    }
  }
  user_data = file("./scripts/script.sh")
  tags = {
    Name = "srv2-index${count.index}"
  }
}

# ec2 instance for server 3
resource "aws_instance" "srv3" {
  ami               = var.ubuntu_ami
  instance_type     = var.instance_type
  availability_zone = element(var.azs, count.index)
  key_name          = var.aws_instance_key
  count                  = length(var.subnets_cidr_srv3)
  # count = 0
  vpc_security_group_ids = [aws_security_group.allow-all.id]
  subnet_id              = element(aws_subnet.public-srv3.*.id, count.index)
  iam_instance_profile   = aws_iam_instance_profile.ctf2022-profile.name
  provisioner "file" {
    source      = "compose/srv3-docker-compose.yml"
    destination = "~/docker-compose.yml"
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("./secrets/ctf2022-key.pem")
      host        = self.public_ip
    }
  }
  user_data = file("./scripts/script.sh")
  tags = {
    Name = "srv3-index${count.index}"
  }
}

# ec2 instance for server 4
resource "aws_instance" "srv4" {
  ami               = var.ubuntu_ami
  instance_type     = var.instance_type
  availability_zone = element(var.azs, count.index)
  key_name          = var.aws_instance_key
  count                  = length(var.subnets_cidr_srv4)
  # count = 0
  vpc_security_group_ids = [aws_security_group.allow-all.id]
  subnet_id              = element(aws_subnet.public-srv4.*.id, count.index)
  iam_instance_profile   = aws_iam_instance_profile.ctf2022-profile.name
  provisioner "file" {
    source      = "compose/srv4-docker-compose.yml"
    destination = "~/docker-compose.yml"
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("./secrets/ctf2022-key.pem")
      host        = self.public_ip
    }
  }
  user_data = file("./scripts/script.sh")
  tags = {
    Name = "srv4-index${count.index}"
  }
}

# ec2 instance for followme
resource "aws_instance" "srv5" {
  ami               = var.ubuntu_ami
  instance_type     = var.instance_type
  availability_zone = "us-east-2a"
  key_name          = var.aws_instance_key
  vpc_security_group_ids = [aws_security_group.allow-all.id]
  subnet_id              = aws_subnet.public-srv5.id
  iam_instance_profile   = aws_iam_instance_profile.ctf2022-profile.name
  user_data = file("./scripts/followme-script.sh")
  tags = {
    Name = "srv5-index0"
  }
}

# instance to run the websites

resource "aws_instance" "sites"{
  ami                    = var.ubuntu_ami
  instance_type          = "t2.micro"
  availability_zone      = element(var.azs, count.index)
  key_name               = var.aws_instance_key
  count                  = length(var.subnets_cidr_sites)
  # count = 0
  vpc_security_group_ids = [aws_security_group.allow-all.id]
  subnet_id              = element(aws_subnet.public-sites.*.id, count.index)
  iam_instance_profile   = aws_iam_instance_profile.ctf2022-profile.name
  provisioner "file" {
    source      = "website-files"
    destination = "~/files"
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("./secrets/ctf2022-key.pem")
      host        = self.public_ip
    }
  }
  user_data = file("./scripts/websites-script.sh")
  tags = {
    Name = "website${count.index}"
  }
}
