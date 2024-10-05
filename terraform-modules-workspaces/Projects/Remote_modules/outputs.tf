output "queue_name" {
    description = "this will be name of SQS queue after creation"
    value = module.Moazam_sqs-through_remote-Modules.queue_name
}
output "queue_arn" {
    description = "this will be name of SQS queue after creation"
    value = module.Moazam_sqs-through_remote-Modules.queue_arn
}