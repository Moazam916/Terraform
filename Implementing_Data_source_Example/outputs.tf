output "SSM_parameter_store_bucket_name" {
  value = data.aws_ssm_parameter.Moazam_Fetching_SSM_parameter_store_parameter.name
}