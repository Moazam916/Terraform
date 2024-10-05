# Archive a single file.

data "archive_file" "lambda_artifacts" {
  type        = "zip"
  source_file = "lambda_function/lambda_function.py"
  output_path = "lambda_artifacts_${formatdate("MMM DD, YYYY", timestamp())}.zip"
}
resource "aws_lambda_function" "Moazam_demo_lambdas" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  filename         = "lambda_artifacts_${formatdate("MMM DD, YYYY", timestamp())}.zip"
  function_name    = "Moazam_lambda_function_name_${count.index}"
  source_code_hash = data.archive_file.lambda_artifacts.output_base64sha256
  role             = var.Iam_role
  handler          = "lambda_function.lambda_handler"
  runtime          = "python3.9"
  count= 2
} # Dynamic blocks are only applicable when resources have repeatabled nested blocks