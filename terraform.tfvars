cidr_blocks = [{
  cidr_block = "10.0.0.0/16"
  name = "terraform_vpc_cidr"
  },
  {
  cidr_block = "10.0.128.0/17"
  name = "terraform_subnet_1_cidr"
  }
]

my_ip = "196.77.0.0/16"

instance_type = "t2.micro"

av_zone = "us-east-1a"

ssh_public_key_path = "/home/tmt/.ssh/id_rsa.pub"
