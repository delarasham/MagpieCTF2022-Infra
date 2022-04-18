# VPC
resource "aws_vpc" "ctf2022-vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "CTF2022-VPC"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "ctf2022-igw" {
  vpc_id = aws_vpc.ctf2022-vpc.id
  tags = {
    Name = "main"
  }
}

# Subnets : public srv1
resource "aws_subnet" "public-srv1" {
  count                   = length(var.subnets_cidr_srv1)
  vpc_id                  = aws_vpc.ctf2022-vpc.id
  cidr_block              = element(var.subnets_cidr_srv1, count.index)
  availability_zone       = element(var.azs, count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "Subnet-srv1-${count.index + 1}"
  }
}

# Subnets : public srv2
resource "aws_subnet" "public-srv2" {
  count                   = length(var.subnets_cidr_srv2)
  vpc_id                  = aws_vpc.ctf2022-vpc.id
  cidr_block              = element(var.subnets_cidr_srv2, count.index)
  availability_zone       = element(var.azs, count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "Subnet-srv2-${count.index + 1}"
  }
}

# Subnets : public srv3
resource "aws_subnet" "public-srv3" {
  count                   = length(var.subnets_cidr_srv3)
  vpc_id                  = aws_vpc.ctf2022-vpc.id
  cidr_block              = element(var.subnets_cidr_srv3, count.index)
  availability_zone       = element(var.azs, count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "Subnet-srv3-${count.index + 1}"
  }
}
# Subnets : public srv4
resource "aws_subnet" "public-srv4" {
  count                   = length(var.subnets_cidr_srv4)
  vpc_id                  = aws_vpc.ctf2022-vpc.id
  cidr_block              = element(var.subnets_cidr_srv4, count.index)
  availability_zone       = element(var.azs, count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "Subnet-srv4-${count.index + 1}"
  }
}

# Subnets : public-sites
resource "aws_subnet" "public-sites" {
  count                   = length(var.subnets_cidr_sites)
  vpc_id                  = aws_vpc.ctf2022-vpc.id
  cidr_block              = element(var.subnets_cidr_sites, count.index)
  availability_zone       = element(var.azs, count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "Subnet-sites-${count.index + 1}"
  }
}

# Subnets : public srv5
resource "aws_subnet" "public-srv5" {
  vpc_id                  = aws_vpc.ctf2022-vpc.id
  cidr_block              = var.subnets_cidr_srv5
  availability_zone       = "us-east-2a"
  map_public_ip_on_launch = true
  tags = {
    Name = "Subnet-srv5-1"
  }
}

# Route table: attach Internet Gateway 
resource "aws_route_table" "ctf2022-rt" {
  vpc_id = aws_vpc.ctf2022-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ctf2022-igw.id
  }
  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = aws_internet_gateway.ctf2022-igw.id
  }
  tags = {
    Name = "ctf2022-rt"
  }
}

# Route table association with public-srv1 subnets
resource "aws_route_table_association" "a-srv1" {
  count          = length(var.subnets_cidr_srv1)
  subnet_id      = element(aws_subnet.public-srv1.*.id, count.index)
  route_table_id = aws_route_table.ctf2022-rt.id
}
# Route table association with public-srv2 subnets
resource "aws_route_table_association" "a-srv2" {
  count          = length(var.subnets_cidr_srv2)
  subnet_id      = element(aws_subnet.public-srv2.*.id, count.index)
  route_table_id = aws_route_table.ctf2022-rt.id
}

# Route table association with public-srv3 subnets
resource "aws_route_table_association" "a-srv3" {
  count          = length(var.subnets_cidr_srv3)
  subnet_id      = element(aws_subnet.public-srv3.*.id, count.index)
  route_table_id = aws_route_table.ctf2022-rt.id
}
# Route table association with public-srv4subnets
resource "aws_route_table_association" "a-srv4" {
  count          = length(var.subnets_cidr_srv4)
  subnet_id      = element(aws_subnet.public-srv4.*.id, count.index)
  route_table_id = aws_route_table.ctf2022-rt.id
}

# Route table association with public-sites subnets
resource "aws_route_table_association" "a-sites" {
  count          = length(var.subnets_cidr_sites)
  subnet_id      = element(aws_subnet.public-sites.*.id, count.index)
  route_table_id = aws_route_table.ctf2022-rt.id
}

# Route table association with public-srv5 subnets
resource "aws_route_table_association" "a-srv5" {
  subnet_id      = aws_subnet.public-srv5.id
  route_table_id = aws_route_table.ctf2022-rt.id
}
