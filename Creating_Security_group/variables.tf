variable "secruity_group_ip" {
  type = string
  description = "Ip to add in ingress rule of security group"
}
variable "ingress_port" {
  type = number
  description = "Port number of allowed from above ip is"
}