import os
import boto3
import json

def get_db_credentials(secret_arn):
    client = boto3.client('secretsmanager', region_name=os.getenv("AWS_REGION", "us-east-1"))
    secret_value = client.get_secret_value(SecretId=secret_arn)
    secret = json.loads(secret_value['SecretString'])
    return secret['username'], secret['password'], secret['dbname']