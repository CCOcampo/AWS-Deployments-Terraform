# Create the S3 bucket
resource "aws_s3_bucket" "lambda_bucket" {
  bucket = "lambda-function-45"
}

# Upload the file lambda_function.py to the S3 bucket
resource "aws_s3_object" "lambda_function_code" {
  bucket = aws_s3_bucket.lambda_bucket.bucket
  key    = "lambda_function.zip"
  source = "/Users/cristhiancamiloocampo/Documents/Proyecto_Data/Git/AWS-Deployments-Terraform/Terra_Lambda/lambda_function.zip"  # Here you indicate the local path of the file
}