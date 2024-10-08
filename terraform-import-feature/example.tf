# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "sg-016dfd00755bb4f64"
resource "aws_security_group" "my-alb-security-group" {
  description = "internet facing application load balancer"
  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }]
  ingress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 80
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 80
  }]
  name                   = "my-alb-security-group"
  name_prefix            = null
  revoke_rules_on_delete = null
  tags = {
    ALB  = "demo"
    Name = "my-alb-security-group"
  }
  tags_all = {
    ALB  = "demo"
    Name = "my-alb-security-group"
  }
  vpc_id = "vpc-f371a98e"
}
