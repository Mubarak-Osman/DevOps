resource "aws_vpc" "main" {
  cidr_block       = "10.11.5.0/24"
  instance_tenancy = "default"

  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "dmz" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.11.5.192/26"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "DMZ"
  }
}

resource "aws_subnet" "default" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.11.5.0/26"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "Default"
  }
}