module "terraform_provider_version" {
  source = "../../Modules/Terraform"
}
module "Moazam_provider" {
  source = "../../Modules/Providers"
}
module "Creating_first_instance_using_module_approach" {
  source        = "../../Modules/ec2"
  instance_type = "t2.micro"
}