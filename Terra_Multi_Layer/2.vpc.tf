# Creación de un VPC
resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
  tags = {
    Name = "${terraform.workspace}-vpc"
  }
}