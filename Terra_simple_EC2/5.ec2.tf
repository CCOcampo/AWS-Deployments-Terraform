resource "aws_instance" "ec2_instance" {
  ami                   = "ami-0182f373e66f89c85" # AMI para Amazon Linux 2
  instance_type         = "t2.micro"
  subnet_id             = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.allow_http.id] # Cambio realizado

  depends_on = [aws_security_group.allow_http] # Dependencia explícita

  user_data = <<-EOF
        #!/bin/bash
        # Actualizar los paquetes del sistema
        sudo dnf update -y

        # Instalar Apache
        sudo dnf install httpd -y

        # Iniciar el servicio Apache
        sudo systemctl start httpd

        # Hacer que Apache se inicie automáticamente al arrancar
        sudo systemctl enable httpd

        # Crear un archivo index.html con el contenido "Hola mundo"
        echo "Hola mundo" | sudo tee /var/www/html/index.html

        # Asegurarse de que el directorio /var/www/html tenga los permisos correctos
        sudo chmod -R 755 /var/www/html
        EOF


  tags = {
    Name = "Hola-Mundo-EC2"
  }

  associate_public_ip_address = true
}

output "instance_public_ip" {
  value = aws_instance.ec2_instance.public_ip
}
