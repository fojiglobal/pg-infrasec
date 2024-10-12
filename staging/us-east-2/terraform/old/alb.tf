resource "aws_lb_target_group" "staging_tg" {
  name     = "${var.staging-env}-tg-80"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.staging.id
  health_check {
    healthy_threshold = 2
    interval = 10
  }
}

resource "aws_lb" "staging-alb" {
  name               = "${var.staging-env}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.public_sg.id]
  subnets            = [aws_subnet.staging_public_subnet_1.id, aws_subnet.staging_public_subnet_2.id]
  
  tags = {
    Name = "${var.staging-env}-alb"
    Environment = var.staging-env
  }
}

resource "aws_lb_listener" "staging_https" {
  load_balancer_arn = aws_lb.staging-alb.arn
  port              = var.alb_port_https
  protocol          = var.alb_protocol_https
  ssl_policy        = var.alb_ssl_profile
  certificate_arn   = data.aws_acm_certificate.alb_cert.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.staging_tg.arn
  }
}

resource "aws_lb_listener" "staging_http_https" {
  load_balancer_arn = aws_lb.staging-alb.arn
  port              = var.alb_port_http
  protocol          = var.alb_protocol_http

  default_action {
    type = "redirect"

    redirect {
      port        = var.alb_port_https
      protocol    = var.alb_protocol_https
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_listener_rule" "staging_web_rule" {
  listener_arn = aws_lb_listener.staging_https.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.staging_tg.arn
  }
  
  condition {
    host_header {
      values = ["staging.pgcloudapps.com", "www.staging.pgcloudapps.com"]
    }
  }
}