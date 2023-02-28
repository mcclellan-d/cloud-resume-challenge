# --- dynamodb/outputs.tf

output "countDBtable_arn" {
    description = "ARN of the DynamoDB table"
    value = aws_dynamodb_table.countDBtable.arn
}