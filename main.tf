terraform {
  required_version = ">= 0.12"
  backend "s3" {
    bucket = "my-bucket"
    key = "my-terraform-state"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

module "firewall" {
  source = "./modules/firewall"
  cidr_blocks = var.cidr_blocks
  my_ip               = var.my_ip
}

module "subnet" {
  source = "./modules/subnet"
  vpc_terraform = module.firewall.vpc_terraform
  igw_terraform =  module.firewall.aws_internet_gateway
  av_zone = var.av_zone
  cidr_blocks = var.cidr_blocks
}

module "server" {
  source = "./modules/webserver"
  instance_type = var.instance_type
  av_zone = var.av_zone
  subnet_id = module.subnet.subnet_id
  terraform_sg = module.firewall.sg_firewall
  ssh_public_key_path = var.ssh_public_key_path
  user_data = var.user_data
}
