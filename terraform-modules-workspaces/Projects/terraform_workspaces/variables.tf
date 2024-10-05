variable "instance_type" {
  type        = map(any)
  description = "Depending on the workspace instance type will get changed "
  default = {
    default = "t2.nano"
    dev     = "t2.micro"
    prod    = "t2.large"
  }
}