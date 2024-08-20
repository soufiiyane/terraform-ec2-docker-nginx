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
  key_name   = "server_keye"
  public_key = file(var.ssh_public_key_path)
}

resource "aws_instance" "terraform-server" {
  ami                    = data.aws_ami.latest_ami.id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.terraform_sg]
  availability_zone      = var.av_zone
  associate_public_ip_address = true
  user_data = file(var.user_data)
  key_name = aws_key_pair.ssh_key.key_name
  tags = {
    Name = "terraform_server_instance"
  }
}