variable "terraform_sg" {
  description = "The ID of the Security Group to associate with the EC2 instance."
}

variable "subnet_id" {
  description = "The ID of the subnet in which the EC2 instance will be launched."
}

variable "instance_type" {
  description = "The type of EC2 instance to launch (e.g., t2.micro, t3.medium)."
}

variable "av_zone" {
  description = "The availability zone where the EC2 instance will be deployed."
}

variable "ssh_public_key_path" {
  description = "The file path to the SSH public key used for accessing the EC2 instance."
}

variable "user_data" {
  description = "The user data script that will be executed upon instance launch."
}
