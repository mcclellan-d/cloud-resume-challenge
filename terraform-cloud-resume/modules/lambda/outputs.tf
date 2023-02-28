# --- lambda/outputs.tf

output "lambda_invoke_arns" {
  value = aws_lambda_function.visitorCountFunction.invoke_arn
}

output "function_name" {
  value = aws_lambda_function.visitorCountFunction.function_name
}