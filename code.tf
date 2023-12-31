provider "aws" {
 region = "ap-south-1"
 access_key = ""
 secret_key = ""
}

resource "aws_vpc" "devops_apr_vpc" {
 cidr_block = "10.0.0.0/16"
 tags = {
    Name = "devops_apr_vpc"
}
}
resource "aws_subnet" "devops_apr_subnet" {
  vpc_id = aws_vpc.devops_apr_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "devops_apr_subnet"
}
}
resource "aws_security_group" "devops_apr_sg" {
  vpc_id = aws_vpc.devops_apr_vpc.id

  ingress {
   from_port = 8080
   to_port = 8080
   protocol = "tcp"
   cidr_blocks = [aws_vpc.devops_apr_vpc.cidr_block]
}

  egress {
   from_port = 0
   to_port = 0
   protocol = "-1"
   cidr_blocks = ["0.0.0.0/0"]
}
   tags = {
     Name = "devops_apr_sg"
}
}
resource "aws_instance" "devops_apr_ec2" {
 ami = "ami-006935d9a6773e4ec"
 instance_type = "t2.micro"

 tags = {
  Name = "devops_apr_ec2"
}
}
