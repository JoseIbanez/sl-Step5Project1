#!/bin/bash
set -e


# GET AWS_ACCOUNT
aws sts get-caller-identity --query "Account" --output text > out/aws_account.txt
export AWS_ACCOUNT=`cat out/aws_account.txt`

# Attach an Inline Policy 
envsubst < bucket_notification.json > out/bucket_notification.json


# S3 notification
aws s3api put-bucket-notification-configuration \
    --bucket $BUCKETNAME \
    --notification-configuration file://out/bucket_notification.json

