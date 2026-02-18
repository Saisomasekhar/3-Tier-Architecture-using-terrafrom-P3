#Create IGW
resource "aws_internet_gateway" "internet-gateway" {
  vpc_id = aws_vpc.project.id
  
  tags = {
    Name = "internet-gateway"
  }
}

