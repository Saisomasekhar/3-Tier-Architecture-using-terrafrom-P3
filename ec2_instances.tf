#Create Public EC2 Instances 
resource "aws_instance" "web" {
  ami           = "ami-0c1fe732b5494dc14"
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.public-subnet-1.id
  security_groups = [aws_security_group.security-group.id]
  key_name = "sai-virginia"


  tags = {
    Name = "Public-instance-1"
  }
}

#Create Public EC2 Instances
resource "aws_instance" "web-2" {
  ami           = "ami-0c1fe732b5494dc14"
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.public-subnet-2.id
  security_groups = [aws_security_group.security-group.id]
  key_name = "sai-virginia"

  tags = {
    Name = "Public-instance-2"
  }
}

#Create Private EC2 Instances
resource "aws_instance" "app" {
  ami           = "ami-0c1fe732b5494dc14"
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.private-subnet-1.id
  security_groups = [aws_security_group.security-group.id]
  key_name = "sai-virginia"

  tags = {
    Name = "Private-instance-1"
  }
}

#Create Private EC2 Instances
resource "aws_instance" "app-2" {
  ami           = "ami-0c1fe732b5494dc14"
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.private-subnet-2.id
  security_groups = [aws_security_group.security-group.id]
  key_name = "sai-virginia"

  tags = {
    Name = "Private-instance-2"
  }
}
