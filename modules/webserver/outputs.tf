output "public_ip" {
  description = "The public IP address of the EC2 instance created by the Terraform configuration."
  value       = aws_instance.terraform-server.public_ip
}
