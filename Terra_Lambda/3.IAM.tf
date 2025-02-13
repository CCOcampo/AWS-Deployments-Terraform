# Create the IAM Role for Lambda
resource "aws_iam_role" "lambda_role" {
  name = "s3-lambda-firstproject"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

# Attach the read-only policy in S3 to the IAM Role
resource "aws_iam_policy_attachment" "lambda_s3_readonly" {
  name       = "lambda-s3-readonly"
  roles      = [aws_iam_role.lambda_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}

# Create policy for writing CloudWatch logs
resource "aws_iam_policy" "lambda_logging" {
  name        = "LambdaLoggingPolicy"
  description = "Permite a Lambda escribir logs en CloudWatch"
  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Action = [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ]
      Resource = "arn:aws:logs:us-east-1:*:*"
    }]
  })
}

# Attach the CloudWatch policy to the Lambda IAM Role
resource "aws_iam_role_policy_attachment" "lambda_logging_attach" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.lambda_logging.arn
}