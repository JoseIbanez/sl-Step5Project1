import json
import boto3
import base64



def lambda_handler(event, context):
    # TODO implement
    print("--event--")
    print(json.dumps(event))
    
    sns_msg = event['Records'][0]['Sns']['Message']
    
    print("--sns--")
    print(sns_msg)
    
    sns = json.loads(sns_msg)
    
    content_b64 = sns['content']
    print("--content b64--")
    print(content_b64)
    
    content = base64.b64decode(content_b64).decode('utf-8')
    print("--content--")
    print(content)



