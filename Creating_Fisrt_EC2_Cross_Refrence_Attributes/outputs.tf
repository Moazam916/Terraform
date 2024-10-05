output "Associated_ip_address_is" {
  description = "the associated value of pulic ip to ec2 instance is"
  value       = aws_instance.cross_refernce_ip.public_ip
}
output "Created_eip_is" {
  description = "The requested EIP is "
  value       = aws_eip.Moazam_First_EIP.public_ip
}