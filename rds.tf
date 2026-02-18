#create DB Subnet Group
resource "aws_db_subnet_group" "db-subnet-group" {
  name       = "db-subnet-group"
  subnet_ids = [aws_subnet.private-subnet-3.id, aws_subnet.private-subnet-4.id]
  
  tags = {
    Name = "db-subnet-group"
  }
}

#create MySql Muti-AZ RDS instance
resource "aws_db_instance" "mysql-instance" {
  identifier              = "mysql-instance"
  allocated_storage       = 20
  storage_type            = "gp2"
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = "db.t3.micro"
  db_name                 = "sai_project"
  username                = "admin"
  password                = "password123"
  parameter_group_name    = "default.mysql8.0"
  multi_az                = true
  publicly_accessible     = false
  skip_final_snapshot     = true
  vpc_security_group_ids = [aws_security_group.security-group.id]
  db_subnet_group_name   = aws_db_subnet_group.db-subnet-group.name
  tags = {
    Name = "mysql-instance"
  } 
}
