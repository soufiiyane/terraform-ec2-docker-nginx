# Terraform AWS EC2 Docker Nginx Setup

This project automates the deployment of an EC2 instance on AWS, installs Docker, and sets up Nginx using Terraform.

## Project Overview

This repository contains Terraform scripts to:
- Create a VPC and subnets.
- Launch an EC2 instance in a specified availability zone.
- Install Docker on the EC2 instance.
- Set up Nginx as a web server using Docker.

## Prerequisites

Before you begin, ensure you have the following installed on your local machine:

- [Terraform](https://www.terraform.io/downloads.html)
- AWS CLI configured with appropriate credentials
- SSH key pair for EC2 instance access

## Github

1. **Clone the Repository**

   ```bash
   git clone https://github.com/soufiiyane/terraform-ec2-docker-nginx.git
   cd terraform-ec2-docker-nginx

## Terraform: How to Deploy and Plan

1. **Initialize Terraform**

   Initialize the Terraform working directory:

   ```bash
   terraform init
   
2. **Plan the Infrastructure**

   ```bash
   terraform plan
   
3. **Deploy the Infrastructure**

   ```bash
   terraform apply

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.