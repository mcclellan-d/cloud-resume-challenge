import json
import boto3


def lambda_handler(event, context):
    # Connect to DynamoDB
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table('visit-count-table')
    # This creates a key in dynamodb if it doesn't exist
    attribute_keyname = 'total-visits'
    try:
        response = update_table(table, attribute_keyname)
        total_visits = int(response.get("Attributes").get("visitCount"))
        return {
            "statusCode": 200,
            'headers': {
                'Access-Control-Allow-Headers': '*',
                'Access-Control-Allow-Origin': '*',
                'Access-Control-Allow-Methods': '*'
            },
            "body": json.dumps({"totalVisits": total_visits})
        }
    except Exception as e:
        return {
            "statusCode": 500,
            "body": json.dumps({"error": str(e)})
        }


def update_table(table, attribute_keyname):
    # Update the table
    response = table.update_item(
        Key={
            'ID': attribute_keyname
        },
        UpdateExpression='ADD visitCount :val',
        ExpressionAttributeValues={
            ':val': 1
        },
        ReturnValues='ALL_NEW'
    )
    return response

# In the future, we can use lambda env variables to store the table name and key name
# This improvement would work well for dev test prod environments.
