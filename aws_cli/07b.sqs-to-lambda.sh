#!/bin/bash
set -e


# Incoming Files  SQS -> Lambda

export SQS_INC_ARN=`cat out/sqs_attr_inc.json | jq -r .Attributes.QueueArn`

aws lambda create-event-source-mapping \
    --function-name $LAMBDA_INC \
    --batch-size 5 \
    --maximum-batching-window-in-seconds 60 \
    --event-source-arn ${SQS_INC_ARN} 
    

# Delete Files  SQS -> Lambda

export SQS_DEL_ARN=`cat out/sqs_attr_del.json | jq -r .Attributes.QueueArn`

aws lambda create-event-source-mapping \
    --function-name $LAMBDA_DEL \
    --batch-size 5 \
    --maximum-batching-window-in-seconds 60 \
    --event-source-arn ${SQS_DEL_ARN} 
    
