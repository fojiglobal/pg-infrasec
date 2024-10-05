resource "aws_launch_template" "staging-lt" {
  name = "${var.staging-env}-lt"
  image_id = "ami-085f9c64a9b75eed5"
  instance_type = "t2.micro"
  key_name = "cs2-use2-main"
  instance_initiated_shutdown_behavior = "terminate"
  vpc_security_group_ids = [aws_security_group.private_sg.id]
  
  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "${var.staging-env}-lt"
    }
  }

  user_data = var.user_data
}

  resource "aws_autoscaling_group" "staging-asg" {
  name = "${var.staging-env}-asg"
  vpc_zone_identifier = [aws_subnet.staging_private_subnet_1.id, aws_subnet.staging_private_subnet_2.id]
  target_group_arns         = [aws_lb_target_group.staging_tg.arn]
  desired_capacity   = 2
  max_size           = 2
  min_size           = 1

  launch_template {
    id      = aws_launch_template.staging-lt.id
    version = "$Latest"
  }
}