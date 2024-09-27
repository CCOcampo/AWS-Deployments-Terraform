resource "aws_s3_bucket" "mi_bucket" {
  bucket = "terraform-states-movie"
  tags = {
    Name        = "Terraform_states_movie"
    Environment = "dev"
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.mi_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

#Una vez inicialice el proyecto, se debe dejar de comentar el siguiente bloque de código para migrar los states en S3
/*
terraform {
  backend "s3" {
    bucket = "Terraform_states_movie"
    key = "Terraform/dev/movies/tfstate.json"
    region = "us-east-1"
  }
}
*/