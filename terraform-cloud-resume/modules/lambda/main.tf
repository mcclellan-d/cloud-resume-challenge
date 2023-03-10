# --- lambda/main.tf

# Archive a single file.
data "archive_file" "visitorCountFile" {
  type        = "zip"
  source_file = "${path.module}/visitorCount.py"
  output_path = "${path.module}/visitorCount.zip"
}

# Upload the archive to S3.
resource "aws_s3_object" "function_upload" {
  bucket = var.lambda_bucket
  key = "visitorCount.zip"
  source = data.archive_file.visitorCountFile.output_path
  etag  = data.archive_file.visitorCountFile.output_md5
}

# create lambda function
resource "aws_lambda_function" "visitorCountFunction" {
  s3_bucket = var.lambda_bucket
  s3_key = aws_s3_object.function_upload.key
  #filename      = "visitorCount.zip"
  function_name = "VisitCountFunction"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "visitorCount.lambda_handler"

  source_code_hash = filebase64sha256(data.archive_file.visitorCountFile.output_path)

  runtime = "python3.9"

  environment {
    variables = {
      foo = "bar"
    }
  }
}

# create IAM role for lambda
resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

# create policy for lambda
resource "aws_iam_role_policy" "lambda_dynamodb" {
  name = "lambda_dynamodb"
  role = aws_iam_role.iam_for_lambda.id
  policy = data.aws_iam_policy_document.lambda_dynamodb.json
}

#  data for policy
data "aws_iam_policy_document" "lambda_dynamodb" {
  statement {
    actions = [
      "dynamodb:PutItem",
      "dynamodb:GetItem",
      "dynamodb:UpdateItem",
      "dynamodb:DeleteItem",
      "dynamodb:Scan",
      "dynamodb:Query",
      "dynamodb:BatchGetItem",
      "dynamodb:BatchWriteItem"
    ]

    resources = [
      var.countDBtable_arn
    ]
  }
}