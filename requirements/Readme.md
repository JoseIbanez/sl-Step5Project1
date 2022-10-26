# Email Notification and Movement Process in an Organization
Project 1 

## DESCRIPTION

You are a Cloud engineer in an IT firm. You are assigned  a critical project. In this project, there will be an application that will upload a file on the Cloud. This file will be processed by a server-less computing platform and will send an email with all the details to the user. When the user receives the email, he/she is notified about it. In case the user wishes to delete the email, he/she has to reply to the email saying Delete. On receiving this response, the file will be deleted and moved to another folder on the Cloud.

 

## Steps to Perform:

1. Create a website where a user can upload a file on the local host
1. Create a lambda handler
1. Create an empty S3 bucket
1. Create an S3 bucket, upload the file, and add an event for email notification using the lambda function
1. Create and configure a queue using the SQS service
1. Verify the email address using the SES service
1. Create and verify the domain using the SES service
1. Create a hosted zone along with two record sets of type MX and TXT using Route 53
1. Create a receipt rule using Route 53
1. Check whether the file selected to be removed from the email moves to the empty bucket