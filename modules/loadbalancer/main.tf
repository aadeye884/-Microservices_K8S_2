# Load Balancer Target Group
resource "aws_lb_target_group" "targetgroup" {
  name     = "targetgroup"
  vpc_id   = var.vpc_name
  port     = 30001
  protocol = "HTTP"
    health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 5
    interval            = 30
    timeout             = 5
  }
}

# Worker1 Target group attachment
resource "aws_lb_target_group_attachment" "targetgroupatt1" {
  target_group_arn = aws_lb_target_group.targetgroup.arn
  target_id        = var.worker1
  port             = 30001
}

# Worker2 Target group attachment
resource "aws_lb_target_group_attachment" "targetgroupatt2" {
  target_group_arn = aws_lb_target_group.targetgroup.arn
  target_id        = var.worker2
  port             = 30001
}

# Worker3 Target group attachment
resource "aws_lb_target_group_attachment" "targetgroupatt3" {
  target_group_arn = aws_lb_target_group.targetgroup.arn
  target_id        = var.worker3
  port             = 30001
}

# Load Balancer Listener
resource "aws_lb_listener" "alblistener" {
  load_balancer_arn = aws_lb.k8s-alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.targetgroup.arn
  }
}

# Application Load Balancer
resource "aws_lb" "k8s-alb" {
  name                       = "k8s-alb"
  security_groups            = var.vpc_security_group_ids
  subnets                    = var.subnetid1
  load_balancer_type         = "application"
}

# Prometheus Load Balancer 
# Worker1 Target group attachment
resource "aws_lb_target_group_attachment" "targetgroupatt4" {
  target_group_arn = aws_lb_target_group.targetgroup.arn
  target_id        = var.worker1
  port             = 31090
}

# Worker2 Target group attachment
resource "aws_lb_target_group_attachment" "targetgroupatt5" {
  target_group_arn = aws_lb_target_group.targetgroup.arn
  target_id        = var.worker2
  port             = 31090
}

# Worker3 Target group attachment
resource "aws_lb_target_group_attachment" "targetgroupatt6" {
  target_group_arn = aws_lb_target_group.targetgroup.arn
  target_id        = var.worker3
  port             = 31090
}

# Application Load Balancer
resource "aws_lb" "pmt-alb" {
  name                       = "pmt-alb"
  security_groups            = var.vpc_security_group_ids
  subnets                    = var.subnetid1
  load_balancer_type         = "application"
}

# Grafana Load Balancer 
# Worker1 Target group attachment
resource "aws_lb_target_group_attachment" "targetgroupatt7" {
  target_group_arn = aws_lb_target_group.targetgroup.arn
  target_id        = var.worker1
  port             = 31300
}

# Worker2 Target group attachment
resource "aws_lb_target_group_attachment" "targetgroupatt8" {
  target_group_arn = aws_lb_target_group.targetgroup.arn
  target_id        = var.worker2
  port             = 31300
}

# Worker3 Target group attachment
resource "aws_lb_target_group_attachment" "targetgroupatt9" {
  target_group_arn = aws_lb_target_group.targetgroup.arn
  target_id        = var.worker3
  port             = 31300
}

# Application Load Balancer
resource "aws_lb" "graf-alb" {
  name                       = "graf-alb"
  security_groups            = var.vpc_security_group_ids
  subnets                    = var.subnetid1
  load_balancer_type         = "application"
}