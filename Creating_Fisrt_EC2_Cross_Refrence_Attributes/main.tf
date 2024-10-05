resource "aws_instance" "cross_refernce_ip" {
  ami           = "ami-04e5276ebb8451442"
  instance_type = "t2.micro"
  tags = {
    Name = "Moazam_First_Ec2"
  }
}
resource "aws_eip" "Moazam_First_EIP" {
  vpc = true
  tags = {
    Name = "Moazam_First_Ec2_eip"
  }
}
resource "aws_eip_association" "eip_association_to_ec2" {
  instance_id   = aws_instance.cross_refernce_ip.id
  allocation_id = aws_eip.Moazam_First_EIP.id
}