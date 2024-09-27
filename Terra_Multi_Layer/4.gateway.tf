# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${terraform.workspace}-igw"
  }
}

# Elastic IP para NAT Gateway en AZ1
resource "aws_eip" "nat_az1" {
  domain = "vpc"
  tags = {
    Name = "${terraform.workspace}-eip-az1"
  }
}

# NAT Gateway en AZ1
resource "aws_nat_gateway" "nat_az1" {
  allocation_id = aws_eip.nat_az1.id
  subnet_id     = aws_subnet.public_subnet_az1.id
  tags = {
    Name = "${terraform.workspace}-nat-gateway-az1"
  }
}