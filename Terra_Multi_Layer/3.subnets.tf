# Subred pública (AZ1)
resource "aws_subnet" "public_subnet_az1" {
  vpc_id                 = aws_vpc.main.id
  cidr_block             = var.public_subnet_az1_cidr
  availability_zone      = var.az_1
  map_public_ip_on_launch = true
  tags = {
    Name = "${terraform.workspace}-public-subnet-az1"
  }
}

# Subred pública (AZ2)
resource "aws_subnet" "public_subnet_az2" {
  vpc_id                 = aws_vpc.main.id
  cidr_block             = var.public_subnet_az2_cidr
  availability_zone      = var.az_2
  map_public_ip_on_launch = true
  tags = {
    Name = "${terraform.workspace}-public-subnet-az2"
  }
}

# Subred privada (AZ1)
resource "aws_subnet" "private_1a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_az1_cidr
  availability_zone = var.az_1
  tags = {
    Name = "${terraform.workspace}-private-subnet-1a"
  }
}

# Subred privada (AZ2)
resource "aws_subnet" "private_1b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_az2_cidr
  availability_zone = var.az_2
  tags = {
    Name = "${terraform.workspace}-private-subnet-1b"
  }
}