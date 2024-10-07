data "terraform_remote_state" "reading_the_state_file_from_s3" {
  backend = "s3"
  config = {
    bucket = "moazam-tarraform-backend"
    key    = "eip.tfstate" #Key to file where terraform will write the state of created resources
    region = "us-east-1"
  }
}