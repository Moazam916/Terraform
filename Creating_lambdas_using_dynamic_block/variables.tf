variable "Iam_role" {
  type        = string
  description = "Iam Role being attached to lambda function"
  default     = "arn:aws:iam::319424532261:role/Moazam-sample-lambda-role"
}