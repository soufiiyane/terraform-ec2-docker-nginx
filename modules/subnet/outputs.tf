output "subnet_id" {
  description = "The ID of the subnet created by the Terraform configuration."
  value       = aws_subnet.terraform_subnet_1.id
}
