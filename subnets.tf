#Create Public Subnet-1
resource "aws_subnet" "public-subnet-1" {
  vpc_id            = aws_vpc.project.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    name = "public-subnet-1"
  }

}

#Create Private Subnet-2
resource "aws_subnet" "public-subnet-2" {
  vpc_id            = aws_vpc.project.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true

    tags = {
        name = "public-subnet-2"
    }
}

#Create Private Subnet-1
resource "aws_subnet" "private-subnet-1" {
  vpc_id            = aws_vpc.project.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

    tags = {
        name = "private-subnet-1"
    }   
}

#Create Private Subnet-2
resource "aws_subnet" "private-subnet-2" {
  vpc_id            = aws_vpc.project.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true

    tags = {
        name = "private-subnet-2"
    }
}

#Create Private Subnet-3
resource "aws_subnet" "private-subnet-3" {
  vpc_id            = aws_vpc.project.id
  cidr_block        = "10.0.5.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

    tags = {
        name = "private-subnet-3"
    }   
}

#Create Private Subnet-4
resource "aws_subnet" "private-subnet-4" {
  vpc_id            = aws_vpc.project.id
  cidr_block        = "10.0.6.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true

    tags = {
        name = "private-subnet-4"
    }
}
