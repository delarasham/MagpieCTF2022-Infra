# Security group that allows all TCP traffic
resource "aws_security_group" "allow-all" {
  name   = "allow-all-traffic"
  vpc_id = aws_vpc.ctf2022-vpc.id
  ingress {
    description = "All TCP"
    from_port   = 0
    to_port     = 65535
    #any protocal
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  egress {
    from_port = 0
    to_port   = 0
    #any protocal
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow-all"
  }
}
