 resource "aws_instance" "Demo" {
  ami           = "ami-04e5276ebb8451442"
  instance_type = "t2.micro"
  tags = {
    Name = "Demo"
    Lifecycle = "devlopment"
    Cost = "078"
    Backend = "s3"
  }
} 


/* resource "time_sleep" "ram_resource_propagation" {
  create_duration = "180s"
} */