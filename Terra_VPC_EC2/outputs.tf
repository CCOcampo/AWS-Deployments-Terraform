output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main_vpc.id
}

output "public_subnet_id" {
  description = "The ID of the public subnet"
  value       = aws_subnet.public_subnet.id
}

output "private_subnet_id" {
  description = "The ID of the private subnet"
  value       = aws_subnet.private_subnet.id
}

output "instance1_public_ip" {
  description = "The public IP of instance 1"
  value       = aws_instance.web[0].public_ip
}

output "instance2_public_ip" {
  description = "The public IP of instance 2"
  value       = aws_instance.web[1].public_ip
}

output "elb_dns_name" {
  description = "The DNS name of the Classic Load Balancer"
  value       = aws_elb.app_clb.dns_name
}
