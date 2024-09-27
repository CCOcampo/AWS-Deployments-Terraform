#Password
resource "random_password" "rds_password" {
  length  = 10
  special = false
}
resource "aws_ssm_parameter" "rds_password" {
  name  = "/rds/${var.app_name}/admin_password"
  type  = "String"
  value = random_password.rds_password.result
}

# Creación del grupo de subredes para RDS, cubriendo dos zonas de disponibilidad
resource "aws_db_subnet_group" "default" {
  name       = "${terraform.workspace}-db-subnet-group"
  subnet_ids = [aws_subnet.private_1a.id,aws_subnet.private_1b.id]

  tags = {
    Name = "${terraform.workspace}-db-subnet-group"
  }
}

# Creación de la base de datos MySQL
resource "aws_db_instance" "db_instance" {
  engine                  = "mysql"
  engine_version          = "8.0.34"
  multi_az                = false #Para alta disponibilidad podriamos utilizar true
  identifier              = "${var.app_name}-db"
  username                = var.db_user
  password                = random_password.rds_password.result
  db_name                 = "movie_db" 
  instance_class          = "db.t3.micro"  
  allocated_storage       = 20
  port                   = 3306
  db_subnet_group_name    = aws_db_subnet_group.default.name
  vpc_security_group_ids  = [aws_security_group.database_security_group.id]
  skip_final_snapshot     = true
}

