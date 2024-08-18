provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "vpc_terraform" {
  cidr_block = var.cidr_blocks[0].cidr_block
  tags = {
    Name : var.cidr_blocks[0].name
  }
}

resource "aws_internet_gateway" "igw_terraform" {
  vpc_id = aws_vpc.vpc_terraform.id
  tags = {
    Name : "igw_terraform"
  }
}

resource "aws_route_table" "terraform_route_table" {
  vpc_id = aws_vpc.vpc_terraform.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_terraform.id
  }
  tags = {
    Name : "terraform_route_table"
  }
}

resource "aws_subnet" "terraform_subnet_1" {
  vpc_id = aws_vpc.vpc_terraform.id
  cidr_block = var.cidr_blocks[1].cidr_block
  availability_zone = var.av_zone
  tags = {
    Name : var.cidr_blocks[1].name
  }
}

resource "aws_route_table_association" "terraform_route_table_assoc_1" {
  subnet_id      = aws_subnet.terraform_subnet_1.id
  route_table_id = aws_route_table.terraform_route_table.id
}

resource "aws_security_group" "terraform_sg" {
  name = "terraform_sg"
  vpc_id      = aws_vpc.vpc_terraform.id
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [var.my_ip]
  }
  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    prefix_list_ids = []
  }
  tags = {
    Name : "terraform_sg"
  }
}

data "aws_ami" "latest_ami" {
  most_recent = true
  owners = ["amazon"]
  filter {
    name = "name"
    values = ["al2023-ami-*-x86_64"]
  }
   filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_key_pair" "ssh_key" {
  key_name   = "server_key"
  public_key = file(var.ssh_public_key_path)
}

resource "aws_instance" "terraform-server" {
  ami                    = data.aws_ami.latest_ami.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.terraform_subnet_1.id
  vpc_security_group_ids = [aws_security_group.terraform_sg.id]
  availability_zone      = var.av_zone
  associate_public_ip_address = true
  key_name = aws_key_pair.ssh_key.key_name
  user_data = file("script.sh")
  tags = {
    Name = "terraform_server_instance"
  }
}
