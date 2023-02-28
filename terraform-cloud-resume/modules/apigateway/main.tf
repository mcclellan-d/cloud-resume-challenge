# --- apigateway/main.tf

# create API Gateway for visitor counter
resource "aws_apigatewayv2_api" "visitor_counter_api" {
  name          = "visitor-counter-api"
  protocol_type = "HTTP"

  tags = var.common_tags
  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_apigatewayv2_stage" "prod-stage" {
  api_id      = aws_apigatewayv2_api.visitor_counter_api.id
  name        = "prod"
  auto_deploy = true
  
}

# create API Gateway route for visitor counter
resource "aws_apigatewayv2_route" "visitor_counter_route" {
  api_id          = aws_apigatewayv2_api.visitor_counter_api.id
  route_key       = "GET /VisitCountFunction"
  target          = "integrations/${aws_apigatewayv2_integration.visit_function.id}"
}

resource "aws_apigatewayv2_integration" "visit_function" {
  api_id           = aws_apigatewayv2_api.visitor_counter_api.id
  integration_type = "AWS_PROXY"

  connection_type           = "INTERNET"
  #content_handling_strategy = "CONVERT_TO_TEXT"
  description               = "Lambda example"
  integration_method        = "POST"
  integration_uri           = var.lambda_invoke_arns
  passthrough_behavior      = "WHEN_NO_MATCH"
}

resource "aws_lambda_permission" "apigateway" {
  statement_id = "AllowExecutionFromAPIGateway"
  action       = "lambda:InvokeFunction"
  function_name = "VisitCountFunction"
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_apigatewayv2_api.visitor_counter_api.execution_arn}/*/*"
}
  



# Consider custom domain in the future
# Could alter code to use a custom domain

