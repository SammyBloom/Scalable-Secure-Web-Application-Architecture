variable "aws_region" {
  description = "States the region the infrastructure will be deployed to"
  default     = "us-east-1"
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
  default     = "10.112.0.0/16"
}

variable "public_subnets" {
  description = "Public subnets CIDR block"
  type        = list(string)
  default     = ["10.112.101.0/24", "10.112.102.0/24"]
}

variable "private_subnets" {
  description = "Private subnets CIDR block"
  type        = list(string)
  default     = ["10.112.1.0/24", "10.112.2.0/24"]
}

variable "database_subnets" {
  description = "Database subnets CIDR block"
  type        = list(string)
  default     = ["10.112.3.0/24", "10.112.4.0/24"]
}

variable "web_ssh_security_group" {
  description = "CIDR block for the web-tier security group tp grant ssh access"
  type        = list(string)
  default     = ["0.0.0.0/0"]  #Should be changed for security reasons
}

variable "app_ssh_security_group" {
  description = "CIDR block for the app-tier security group tp grant ssh access"
  type        = list(string)
  default     = ["0.0.0.0/0"] #Should be changed for security reasons
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

variable "db_sgr" {
  description = "CIDR block for the database-tier security group t0 grant ssh access"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "db_instance_class" {
  description = "RDS instance for the database tier"
  default = "db.t2.micro"
}

variable "db_username" {
  description = "RDS Username"
  default = "admin"
}

variable "db_password" {
  description = "RDS Password"
  sensitive = true
}

variable "multi_az" {
  description = "Multi-az deployment for the RDS"
  default = false
}