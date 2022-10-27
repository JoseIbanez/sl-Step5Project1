#!/bin/bash
set -e



# GET AWS_ACCOUNT
aws sts get-caller-identity --query "Account" --output text > out/aws_account.txt
export AWS_ACCOUNT=`cat out/aws_account.txt`


# Create an IAM role - for Lambda
aws iam create-role \
    --role-name $LAMBDA_ROLE \
    --assume-role-policy-document file://lambda_role_TrushRelationship.json \
    > out/role.json


# Attach an Inline Policy 
envsubst < lambda_policy_SQS.json > out/lambda_policy_SQS.json

aws iam put-role-policy \
    --role-name $LAMBDA_ROLE \
    --policy-name $LAMBDA_POLICY \
    --policy-document file://out/lambda_policy_SQS.json \
    > out/inline_policy.json


# Attach a Managed Policy
aws iam attach-role-policy \
    --role-name $LAMBDA_ROLE \
    --policy-arn arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole 
