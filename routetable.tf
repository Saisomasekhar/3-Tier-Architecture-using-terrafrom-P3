#Create Public Route Table
resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.project.id

  tags = {
    Name = "public-route-table"
  }
}

#Create Route for Public Route Table
resource "aws_route" "public-route" {
  route_table_id = aws_route_table.public-route-table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.internet-gateway.id
}

#Subnet Association with Public Route Table
resource "aws_route_table_association" "public-1" {
  subnet_id      = aws_subnet.public-subnet-1.id
  route_table_id = aws_route_table.public-route-table.id    
}

#Create Route for Public Route Table
resource "aws_route_table_association" "public-2" {
  subnet_id      = aws_subnet.public-subnet-2.id
  route_table_id = aws_route_table.public-route-table.id    
}

#Create Private Route Table
resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.project.id

  tags = {
    Name = "private-route-table"
  }
}

resource "aws_route" "private-route" {
  route_table_id = aws_route_table.private-route-table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.nat-gateway.id
}

#Subnet Association with Private Route Table
resource "aws_route_table_association" "private-1" {
  subnet_id      = aws_subnet.private-subnet-1.id
  route_table_id = aws_route_table.private-route-table.id
}

resource "aws_route_table_association" "private-2" {
  subnet_id      = aws_subnet.private-subnet-2.id
  route_table_id = aws_route_table.private-route-table.id
}

resource "aws_route_table_association" "private-3" {
  subnet_id      = aws_subnet.private-subnet-3.id
  route_table_id = aws_route_table.private-route-table.id
}

resource "aws_route_table_association" "private-4" {
  subnet_id      = aws_subnet.private-subnet-4.id
  route_table_id = aws_route_table.private-route-table.id
}
