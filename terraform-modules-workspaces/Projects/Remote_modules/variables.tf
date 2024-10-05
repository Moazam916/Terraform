variable "moazam_queue_name" {
  type        = string
  default     = "Moazam-demo-sqs-queue"
  description = "This is the name of queue"
}
variable "fifo_policy" {
  type        = bool
  default     = true
  description = "Is First in and First out Policy is applicable"
}