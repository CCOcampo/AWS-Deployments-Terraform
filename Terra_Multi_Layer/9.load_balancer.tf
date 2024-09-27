# Creación del balanceador de carga
resource "aws_lb" "app" {
  name               = "${terraform.workspace}-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = [aws_subnet.public_subnet_az1.id, aws_subnet.public_subnet_az2.id]

  enable_deletion_protection = false

  tags = {
    Name = "${terraform.workspace}-load-balancer"
  }
}

# Creación del grupo de destino
resource "aws_lb_target_group" "app" {
  name     = "${terraform.workspace}-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id

  health_check {
    path                = "/health"
    interval            = 30
    timeout             = 5
    healthy_threshold  = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name = "${terraform.workspace}-target-group"
  }
}

# Listener del balanceador de carga
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.app.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.app.arn
  }
}

resource "aws_lb_target_group_attachment" "frontend" {
  count            = 2  # Aplica a dos instancias
  target_group_arn = aws_lb_target_group.app.arn
  target_id        = aws_instance.frontend[count.index].id  # Usa indexación de `count`
  port             = 80
}