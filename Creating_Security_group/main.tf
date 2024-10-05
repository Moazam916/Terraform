resource "aws_security_group" "Moazam_security_group" {
  name        = "Moazam_security_group_terraform"
  description = "Allow TLS inbound traffic and all outbound traffic"

  tags = {
    Name = "Moazam_security_group_terraform"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.Moazam_security_group.id
  cidr_ipv4         = var.secruity_group_ip
  from_port         = var.ingress_port
  ip_protocol       = "tcp"
  to_port           = var.ingress_port
}
resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.Moazam_security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
