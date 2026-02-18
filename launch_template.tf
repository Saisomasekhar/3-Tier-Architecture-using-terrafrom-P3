#Create AMI for Auto Scaling Group
resource "aws_ami_from_instance" "server-double" {
  name               = "app-ami"
  source_instance_id = aws_instance.app.id

  tags = {
    Name = "Server-double"
  }
}

#Create Launch Template for Auto Scaling Group
resource "aws_launch_template" "launch-template" {
  name_prefix   = "launch-template"
  image_id      = aws_ami_from_instance.server-double.id
  instance_type = "t3.micro"
  key_name      = "sai-virginia"

  network_interfaces {
    security_groups = [aws_security_group.security-group.id]
    subnet_id       = aws_subnet.private-subnet-1.id
  }

  tags = {
    Name = "launch-template"
  }
}

#Create Auto Scaling Group
resource "aws_autoscaling_group" "app-asg" {
  name                      = "app-asg"
  max_size                  = 2
  min_size                  = 1
  desired_capacity          = 1
  
  launch_template {
    id      = aws_launch_template.launch-template.id
    version = "$Latest"
  }
  
  target_group_arns         = [aws_lb_target_group.app-target-group.arn]
  
#   tags = [
#     {
#       key                 = "Name"
#       value               = "app-asg-instance"
#       propagate_at_launch = true
#     }
#   ]
}   

#Create Auto Scaling Group
resource "aws_autoscaling_group" "web-asg" {
    name                      = "web-asg"
    max_size                  = 2
    min_size                  = 1
    desired_capacity          = 1
    
    launch_template {
        id      = aws_launch_template.launch-template.id
        version = "$Latest"
    }
    
    target_group_arns         = [aws_lb_target_group.web-target-group.arn]
    
    # tags = [
    #     {
    #     key                 = "Name"
    #     value               = "web-asg-instance"
    #     propagate_at_launch = true
    #     }
    # ]
}


