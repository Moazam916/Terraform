resource "aws_instance" "Moazam_first_ec2" {
  ami           = "ami-04e5276ebb8451442"
  instance_type = var.instance_type
  tags = {
    Name = "Moazam_First_Ec2"
  }
}