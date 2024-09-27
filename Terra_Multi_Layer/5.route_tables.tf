# Tabla de rutas públicas
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "${terraform.workspace}-public-rt"
  }
}

# Tabla de rutas privadas para AZ1 (con NAT Gateway en AZ1)
resource "aws_route_table" "private_rt_az1" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_az1.id
  }
  tags = {
    Name = "${terraform.workspace}-private-rt-az1"
  }
}

# Asignar tabla de rutas públicas a las subredes públicas
resource "aws_route_table_association" "public_subnet_az1_assoc" {
  subnet_id      = aws_subnet.public_subnet_az1.id
  route_table_id = aws_route_table.public_rt.id
}

# Asignar tabla de rutas privadas a las subredes privadas
resource "aws_route_table_association" "private_subnet_az1_assoc" {
  subnet_id      = aws_subnet.private_1a.id
  route_table_id = aws_route_table.private_rt_az1.id
}
