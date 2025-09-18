# webshop_sg: Erlaube TCP 22, 80 von überall, alle ausgehend
resource "aws_security_group" "webshop_sg" {
  name        = "webshop_sg"
  description = "Allow TCP 22 and 80 from anywhere, all outbound"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "Allow SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "Allow HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "webshop_sg"
  }
}

# webserveronly: Erlaube TCP 22, 3306 nur aus internen Subnetzen, alle ausgehend
resource "aws_security_group" "webserveronly" {
  name        = "webserveronly"
  description = "Allow TCP 22 and 3306 only from internal subnets, all outbound"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "Allow SSH from internal"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [
      aws_subnet.dmz.cidr_block,
      aws_subnet.default.cidr_block
    ]
  }

  ingress {
    description = "Allow MySQL from internal"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [
      aws_subnet.dmz.cidr_block,
      aws_subnet.default.cidr_block
    ]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "webserveronly"
  }
}