resource "aws_subnet" "terraform_subnet_1" {
  vpc_id = var.vpc_terraform
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

resource "aws_route_table" "terraform_route_table" {
  vpc_id = var.vpc_terraform
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_terraform
  }
  tags = {
    Name : "terraform_route_table"
  }
}
