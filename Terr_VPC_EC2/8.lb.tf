# Classic Load Balancer
resource "aws_elb" "app_clb" {
  name = "classic-lb"
  security_groups = [aws_security_group.instance_sg.id]
  subnets = [aws_subnet.public_subnet.id]  
  listener {
    instance_port     = 80
    instance_protocol = "HTTP"
    lb_port           = 80
    lb_protocol       = "HTTP"
  }

  instances = aws_instance.web[*].id

  health_check {
    target              = "HTTP:80/"
    interval            = 30
    timeout             = 10
    healthy_threshold   = 2
    unhealthy_threshold = 5
  }

  tags = {
    Name = "LoadBalancer"
  }
}