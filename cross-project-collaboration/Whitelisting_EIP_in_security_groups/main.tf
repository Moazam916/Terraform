resource "aws_security_group" "Moazam_demo_sg" {
  name        = "demo-security-group-to-whitelist-eip"
  description = "Creating the demo security group through terraform to whitelist EIP as part of an ingress rule"
  tags = {
    Name = "allow_tls"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_eip_ipv4" {
  security_group_id = aws_security_group.Moazam_demo_sg.id
  cidr_ipv4         = "${data.terraform_remote_state.reading_the_state_file_from_s3.outputs.Fetching_eip}/32"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}