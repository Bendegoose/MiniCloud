resource "aws_vpc" "minicloud" {
  cidr_block           = var.aws_vpc
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "main"
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "private_a" {
  availability_zone = data.aws_availability_zones.available.names[0]

  vpc_id     = aws_vpc.minicloud.id
  cidr_block = var.aws_private_subnet_a

  tags = {
    Name = "minicloud-private_a"
  }
}

resource "aws_subnet" "private_b" {
  availability_zone = data.aws_availability_zones.available.names[1]

  vpc_id     = aws_vpc.minicloud.id
  cidr_block = var.aws_private_subnet_b

  tags = {
    Name = "minicloud-private_b"
  }
}


resource "aws_subnet" "public_a" {
  availability_zone = data.aws_availability_zones.available.names[0]

  vpc_id     = aws_vpc.minicloud.id
  cidr_block = var.aws_public_subnet_a

  tags = {
    Name = "minicloud-public-a"
  }
}

resource "aws_subnet" "public_b" {
  availability_zone = data.aws_availability_zones.available.names[1]

  vpc_id     = aws_vpc.minicloud.id
  cidr_block = var.aws_public_subnet_b

  tags = {
    Name = "minicloud-public-b"
  }
}

resource "aws_internet_gateway" "minicloud_igw" {
  vpc_id = aws_vpc.minicloud.id

  tags = {
    Name = "mincloud-igw"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.minicloud.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.minicloud_igw.id
  }

  tags = {
    Name = "minicloud-public-route-table"
  }
}

resource "aws_route_table_association" "pub_a_sub_rt_assoc" {
  subnet_id      = aws_subnet.public_a.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "pub_b_sub_rt_assoc" {
  subnet_id      = aws_subnet.public_b.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_eip" "nat_eip" {
  domain = "vpc"
}

resource "aws_nat_gateway" "nat_gw_public_a" {
  allocation_id = aws_eip.nat_eip.allocation_id
  subnet_id     = aws_subnet.public_a.id

  tags = {
    Name = "nat-gateway-public-a"
  }

  depends_on = [aws_internet_gateway.minicloud_igw]
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.minicloud.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw_public_a.id
  }

  tags = {
    Name = "minicloud-private-route-table"
  }
}

resource "aws_route_table_association" "priv_a_sub_rt_assoc" {
  subnet_id      = aws_subnet.private_a.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "priv_b_sub_rt_assoc" {
  subnet_id      = aws_subnet.private_b.id
  route_table_id = aws_route_table.private_rt.id
}