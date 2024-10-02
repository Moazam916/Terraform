# Getting the ARN exisiting lambda role of execution
data "aws_iam_role" "Moazam_lambda_execution_role" {
  name = "Moazam-sample-lambda-role"
}

# Generating the zip file of lambda artifacts
data "archive_file" "lambda_artifacts" {
  type        = "zip"
  source_file = "./lambda_function/lambda_function.py"
  output_path = "lambda_artifacts_${formatdate("MMM-DD-YYYY", timestamp())}.zip"
}

# Provisioning lambda function
resource "aws_lambda_function" "Moazam_demo_lambdas" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  filename         = "lambda_artifacts_${formatdate("MMM-DD-YYYY", timestamp())}.zip"
  function_name    = "Moazam_lambda_function_name"
  source_code_hash = data.archive_file.lambda_artifacts.output_base64sha256
  role             = data.aws_iam_role.Moazam_lambda_execution_role.arn
  handler          = "lambda_function.lambda_handler"
  runtime          = "python3.9"
} # end of lambda function provisioning

# API Gateway
resource "aws_api_gateway_rest_api" "api_gateway" {
  name        = "Moazam-demo-api-Gateway"
  description = "API Gateway with Lambda backend"
}

# API Gateway resource (i.e., /example)
resource "aws_api_gateway_resource" "example_resource" {
  rest_api_id = aws_api_gateway_rest_api.api_gateway.id
  parent_id   = aws_api_gateway_rest_api.api_gateway.root_resource_id
  path_part   = "example"
}

# API Gateway method (i.e., GET method for /example)
resource "aws_api_gateway_method" "get_method" {
  rest_api_id   = aws_api_gateway_rest_api.api_gateway.id
  resource_id   = aws_api_gateway_resource.example_resource.id
  http_method   = "GET"
  authorization = "NONE"
}

# Lambda Integration with API Gateway
resource "aws_api_gateway_integration" "lambda_integration" {
  rest_api_id             = aws_api_gateway_rest_api.api_gateway.id
  resource_id             = aws_api_gateway_resource.example_resource.id
  http_method             = aws_api_gateway_method.get_method.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.Moazam_demo_lambdas.invoke_arn
}

# API Gateway deployment
resource "aws_api_gateway_deployment" "api_deployment" {
  rest_api_id = aws_api_gateway_rest_api.api_gateway.id
  stage_name  = "prod"

  depends_on = [aws_api_gateway_integration.lambda_integration]
}

# Permissions for API Gateway to invoke Lambda
resource "aws_lambda_permission" "api_gateway_permission" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.Moazam_demo_lambdas.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.api_gateway.execution_arn}/*/*"
}

