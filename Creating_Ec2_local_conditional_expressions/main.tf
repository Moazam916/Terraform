resource "aws_instance" "Moazam_first_ec2" {
  ami           = "ami-04e5276ebb8451442"
  instance_type = "t2.micro"
  count         = local.count_condition
  tags          = local.common_tags
}