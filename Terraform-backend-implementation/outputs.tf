output "moazam_fisrt_output" {
  value = aws_instance.Demo.arn
}
output "Fetching_tags" {
  value = aws_instance.Demo.tags_all
}