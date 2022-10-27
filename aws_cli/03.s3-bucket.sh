#!/bin/bash
set -e



aws s3api create-bucket \
    --bucket $BUCKETNAME \
    > out/web-s3.json
    
envsubst < bucket_policy.json > out/bucket_policy.json
envsubst < bucket_cors.json   > out/bucket_cors.json

aws s3api put-bucket-policy --bucket $BUCKETNAME --policy file://out/bucket_policy.json
aws s3api put-bucket-cors   --bucket $BUCKETNAME --cors-configuration file://out/bucket_cors.json



