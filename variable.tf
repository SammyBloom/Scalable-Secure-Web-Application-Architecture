variable "aws_region" {
  description = "States the region the infrastructure will be deployed to"
  default     = "us-west-2"
}

variable "aws_profile" {
  description = "States the AWS CLI profile to be used to authenticate and access aws"
  default     = "vscode"
}

variable "environment" {
  description = "Environment for the infrastructure e.g dev, staging, production"
  default     = "dev"
}

variable "vpc_cidr" {
  description = "VPC CIDR block for connection and access"
  default     = "10.128.0.0/16"
}

variable "public_subnets" {
  description = "Public subnets CIDR block"
  type        = list(string)
  default     = ["10.128.101.0/24", "10.128.102.0/24"]
}

variable "private_subnets" {
  description = "Private subnets CIDR block"
  type        = list(string)
  default     = ["10.128.1.0/24", "10.128.2.0/24"]
}

variable "database_subnets" {
  description = "Database subnets CIDR block"
  type        = list(string)
  default     = ["10.128.3.0/24", "10.128.4.0/24"]
}

variable "web_ssh_security_group" {
  description = "CIDR block for the web-tier security group tp grant ssh access"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "app_ssh_security_group" {
  description = "CIDR block for the app-tier security group tp grant ssh access"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "db_ssh_security_group" {
  description = "CIDR block for the database-tier security group t0 grant ssh access"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "web_instance_type" {
  description = "EC2 instance type for the web tier"
  default     = "t2.micro"
}

variable "app_instance_type" {
  description = "EC2 instance type for the app tier"
  default     = "t2.micro"
}