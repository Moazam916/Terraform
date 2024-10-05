output "Security_group" {
  description = "Trying to Fetch aws security group id as a output"
  value       = aws_security_group.Moazam_security_group.id
}