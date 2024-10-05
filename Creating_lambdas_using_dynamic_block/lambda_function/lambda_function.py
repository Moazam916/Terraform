import boto3
def lambda_handler(event, context):
    print("this is Testing section being added to see if the lambda get updated in lambda function")
    print(event)
    return 'Hello from Lambda!'