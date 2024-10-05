module "terraform_provider_version" {
  source = "../../Modules/Terraform"
}
module "Moazam_provider" {
  source = "../../Modules/Providers"
}
module "Moazam_sqs-through_remote-Modules" {
  source = "terraform-aws-modules/sqs/aws"

  name = var.moazam_queue_name

  fifo_queue = var.fifo_policy

  tags = local.sqs_queue_tags
}