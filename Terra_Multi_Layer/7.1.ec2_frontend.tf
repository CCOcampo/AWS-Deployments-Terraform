# Creación de una instancia EC2

locals {
  # Set environment variables for database settings
  # TODO: Update to a more "secure" approach with SSM Parameter Store or Secrets Manager
  env_vars_front = <<-EOF
    #!/bin/bash
    sudo su -
    echo export DB_HOST="${aws_db_instance.db_instance.address}" >> /etc/profile
    echo export DB_PASS="${random_password.rds_password.result}" >> /etc/profile
    echo export DB_USER="${var.db_user}" >> /etc/profile
    echo export DB_NAME="${var.db_name}" >> /etc/profile
    echo export S3_BUCKET="${aws_s3_bucket.mi_bucket.bucket}" >> /etc/profile
    echo export PORT="${var.backfront_port}" >> /etc/profile
    echo export BACKEND_URL="${aws_instance.backend.private_ip}" >> /etc/profile
    source /etc/profile
  EOF

    # Combine environment variables with the user_data script
  user_data_env_front = "${local.env_vars_front}\n${file("./Scripts/frontend.sh")}"
}

/* Lo mas recomendable seria utilizar instancias reservasdas dependiendo del tiempo que lo va a utilizar o instancias 
spot si el cliente esta dispuesto a tener instancias que puedan ser interrumpidas
*/

resource "aws_instance" "frontend" {
  count           = 2
  ami             = "ami-0182f373e66f89c85"
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.public_subnet_az1.id
  security_groups = [aws_security_group.instance_sg.id]
  associate_public_ip_address = true
  user_data       = local.user_data_env_front
  key_name = "Cristhian_Mac" #Depende del nombre de la llave que se tenga en AWS

  tags = {
    Name = "${terraform.workspace}-frontend-${count.index + 1}"
  }
  depends_on = [aws_instance.backend]
}
