#Create NAT Gateway
resource "aws_nat_gateway" "nat-gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public-subnet-1.id

  tags = {
    Name = "project-nat-gateway"
  }
}



