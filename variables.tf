variable cidr_blocks {
  description = "cidr blocks and name tags for vpc and subnets"
  type = list(object({
    cidr_block = string
    name = string
  }))
}

variable my_ip {
  description = "my ip address"
  type = string
}

variable instance_type {
  description = "instance type"
  type = string
}

variable av_zone {
  description = "availability zone"
  type = string
}

variable ssh_public_key_path {
  description = "public key path"
  type = string
}
