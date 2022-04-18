import os
import sys
# s3
import boto3
from botocore.client import Config


def s3_uploader():
    #getting file path
    filepath = sys.argv[1]
    # file name to save to s3
    filename = sys.argv[2]
    # config s3
    ACCESS_KEY_ID = ""
    SECRET_ACCESS_KEY = ""
    AWS_S3_BUCKET = sys.argv[3]
    s3 = boto3.client('s3', config=Config(signature_version="s3v4"), aws_access_key_id=ACCESS_KEY_ID,
                      aws_secret_access_key=SECRET_ACCESS_KEY, region_name="us-east-2")
    #upload file
    s3.upload_file(filepath, AWS_S3_BUCKET, filename)


s3_uploader()
