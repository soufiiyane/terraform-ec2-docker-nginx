variable "vpc_terraform" {
  description = "The ID of the VPC where resources will be created."
  type = string
}

variable "igw_terraform" {
  description = "The ID of the Internet Gateway associated with the VPC."
  type = string
}

variable "cidr_blocks" {
  description = "A list of CIDR blocks and corresponding name tags for the VPC and subnets."
  type = list(object({
    cidr_block = string
    name       = string
  }))
}

variable "av_zone" {
  description = "The availability zone in which the resources will be deployed."
  type = string
}
