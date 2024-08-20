variable cidr_blocks {
  description = "cidr blocks and name tags for vpc and subnets"
  type = list(object({
    cidr_block = string
    name = string
  }))
}

variable "my_ip" {
  description = "Your public IP address, used to allow secure SSH access to the EC2 instance."
  type        = string
}

variable "av_zone" {
  description = "The AWS availability zone where the resources, such as the EC2 instance and subnet, will be deployed."
  type        = string
}

variable "ssh_public_key_path" {
  description = "The file path to the SSH public key, which will be used for authenticating access to the EC2 instance."
  type        = string
}

variable "instance_type" {
  description = "The type of EC2 instance to be launched (e.g., t2.micro, t3.medium)."
  type        = string
}

variable "user_data" {
  description = "The user data script that will be executed upon EC2 instance launch."
}

