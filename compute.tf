# Compute resources (Launch Template, Autoscaling Group, ) for web-tier
resource "aws_launch_template" "bloom_web" {
  name_prefix   = "web-lt-"
  image_id      = data.aws_ami.server_ami.id #AMI ID for Ubuntu 22.04
  instance_type = var.web_instance_type   #Can be changed in the variable.tf file

  vpc_security_group_ids = [aws_security_group.bloom_web.id]

  user_data = base64encode(templatefile("${path.module}/userdata_web.tpl", {}))

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "bloom_web" {
  name_prefix          = "web-asg-"
  launch_configuration = aws_launch_template.bloom_web.id
  min_size             = 1
  max_size             = 4
  desired_capacity     = 2
  vpc_zone_identifier  = module.vpc.public_subnets
  target_group_arns    = [aws_lb_target_group.bloom_web.arn]

  tag {
    key                 = "Name"
    value               = "web"
    propagate_at_launch = true
  }

  tag {
    key                 = "Terraform"
    value               = "true"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = var.environment
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}


# Compute resources (Launch Template, Autoscaling Group, ) for app-tier

resource "aws_launch_template" "bloom_app" {
  name_prefix   = "app-lt-"
  image_id      = data.aws_ami.server_ami.id #AMI ID for Ubuntu 22.04
  instance_type = var.app_instance_type   #Can be changed in the variable.tf file

  vpc_security_group_ids = [aws_security_group.bloom_web.id]

  user_data = base64encode(templatefile("${path.module}/userdata_app.tpl", {}))

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "bloom_app" {
  name_prefix          = "app-asg-"
  launch_configuration = aws_launch_template.bloom_app.id
  min_size             = 1
  max_size             = 3
  desired_capacity     = 2
  vpc_zone_identifier  = module.vpc.private_subnets
  target_group_arns    = [aws_lb_target_group.bloom_app.arn]

  tag {
    key                 = "Name"
    value               = "app"
    propagate_at_launch = true
  }

  tag {
    key                 = "Terraform"
    value               = "true"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = var.environment
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}

# Compute resources - Load Balancer to manage the web tier
resource "aws_lb" "bloom_web" {
  name               = "web-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.bloom_web.id]
  subnets            = module.vpc.public_subnets

  tags = {
    Terraform   = "true"
    Environment = var.environment
  }
}

resource "aws_lb_target_group" "bloom_web" {
  name     = "web-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc_id
}

resource "aws_lb_listener" "bloom_web" {
  load_balancer_arn = aws_lb.bloom_web.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.bloom_web.arn
  }
}


# Compute resources - Load Balancer to manage the app tier
resource "aws_lb" "bloom_app" {
  name               = "app-lb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [aws_security_group.bloom_app.id]
  subnets            = module.vpc.private_subnets

  tags = {
    Terraform   = "true"
    Environment = var.environment
  }
}

resource "aws_lb_target_group" "bloom_app" {
  name     = "app-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc_id
}

resource "aws_lb_listener" "bloom_app" {
  load_balancer_arn = aws_lb.bloom_app.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.bloom_app.arn
  }
}
