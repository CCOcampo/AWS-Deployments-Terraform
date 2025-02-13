# EC2 Instances
resource "aws_instance" "web" {
  count         = 2
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public_subnet.id
  security_groups = [aws_security_group.instance_sg.id]


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

      # Obtener el nombre de la instancia y la IP pública
      INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
      PUBLIC_IP=$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4)
      INSTANCE_NAME="WebServer${count.index + 1}"

      # Crear un archivo index.html con un mensaje personalizado y fuente más grande
      echo "<html><body><h1 style='font-size:50px; color:blue;'>¡Hola Mundo desde la instancia $INSTANCE_NAME!</h1></body></html>" | sudo tee /var/www/html/index.html

      # Asegurarse de que el directorio /var/www/html tenga los permisos correctos
      sudo chmod -R 755 /var/www/html
  EOF

  tags = {
    Name = "WebServer${count.index + 1}"
  }
}