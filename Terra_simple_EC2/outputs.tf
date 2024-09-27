output "public_ip" {
  value = aws_instance.ec2_instance.public_ip
  description = "La IP pública de la instancia EC2"
}
