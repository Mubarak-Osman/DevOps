resource "aws_network_acl" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main-acl"
  }
}

# Erlaube alle eingehenden Regeln
resource "aws_network_acl_rule" "inbound_allow_all" {
  network_acl_id = aws_network_acl.main.id
  rule_number    = 100
  egress        = false
  protocol      = "-1"
  rule_action   = "allow"
  cidr_block    = "0.0.0.0/0"
  from_port     = 0
  to_port       = 0
}

# Erlaube alle ausgehenden Regeln
resource "aws_network_acl_rule" "outbound_allow_all" {
  network_acl_id = aws_network_acl.main.id
  rule_number    = 100
  egress        = true
  protocol      = "-1"
  rule_action   = "allow"
  cidr_block    = "0.0.0.0/0"
  from_port     = 0
  to_port       = 0
}