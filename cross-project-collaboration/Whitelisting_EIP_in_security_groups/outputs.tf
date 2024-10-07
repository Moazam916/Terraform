output "whitelisted_EIP" {
  value = "the whitelisted EIP is: ${data.terraform_remote_state.reading_the_state_file_from_s3.outputs.Fetching_eip}"
}