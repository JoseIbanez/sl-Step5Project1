#!/bin/sh

aws s3 ls 
aws s3 cp ../requirements/Readme.md s3://$BUCKET_INC/01.txt
