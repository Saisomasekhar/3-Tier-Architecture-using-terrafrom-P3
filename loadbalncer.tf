#Create Target Group
resource "aws_lb_target_group" "app-target-group" {
  name     = "app-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.project.id
  
  tags = {
    Name = "app-target-group"
  }
}


#Create App Load Balancer
resource "aws_lb" "app-load-balancer" {
  name               = "app-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.security-group.id]
  subnets            = [aws_subnet.public-subnet-1.id, aws_subnet.public-subnet-2.id]  
  tags = {
    Name = "app-load-balancer"
  }
}

#Create Listener
resource "aws_lb_listener" "app-listener" {
  load_balancer_arn = aws_lb.app-load-balancer.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app-target-group.arn
  }
}


#Create Web Target Group 
resource "aws_lb_target_group" "web-target-group" {
  name     = "web-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.project.id
  
  tags = {
    Name = "web-target-group"
  }
}

#Create App Load Balancer
resource "aws_lb" "web-load-balancer" {
  name               = "web-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.security-group.id]
  subnets            = [aws_subnet.private-subnet-1.id, aws_subnet.private-subnet-2.id]
  
  tags = {
    Name = "web-load-balancer"
  }
}

#Create Listener
resource "aws_lb_listener" "web-listener" {
  load_balancer_arn = aws_lb.web-load-balancer.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web-target-group.arn
  }
}