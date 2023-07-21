module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "bloom_vpc"
  cidr = var.vpc_cidr

  azs              = ["${var.aws_region}a", "${var.aws_region}b"]
  public_subnets   = var.public_subnets
  private_subnets  = var.private_subnets
  database_subnets = var.database_subnets

  enable_dns_hostnames = true
  enable_dns_support   = true
  enable_nat_gateway   = true
  enable_vpn_gateway   = false

  public_subnet_names   = ["web-subnet-1", "web-subnet-2"]
  private_subnet_names  = ["app-subnet-1", "app-subnet-2"]
  database_subnet_names = ["db-subnet-1", "db-subnet-2"]

  tags = {
    Terraform   = "true"
    Environment = var.environment
  }

}


# Security group for the web-tier of our application

resource "aws_security_group" "bloom_web" {
  name        = "bloom_web"
  description = "Allow inbound traffic for the web tier of our application"
  vpc_id      = module.vpc.vpc_id
}

resource "aws_security_group_rule" "bloom_web" {
  security_group_id = aws_security_group.bloom_web.id

  type        = "ingress"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "bloom_web_ssh" {
  security_group_id = aws_security_group.bloom_web.id

  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = var.web_ssh_security_group #Should be changed for security reasons
}


# Security group for the app-tier of our application

resource "aws_security_group" "bloom_app" {
  name        = "bloom_app"
  description = "Allow inbound traffic for the app tier of our application"
  vpc_id      = module.vpc.vpc_id
}

resource "aws_security_group_rule" "bloom_app" {
  security_group_id = aws_security_group.bloom_app.id

  type        = "ingress"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "bloom_app_ssh" {
  security_group_id = aws_security_group.bloom_app.id

  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = var.app_ssh_security_group #Should be changed for security reasons
}


# Security group for the database-tier of our application

resource "aws_security_group" "bloom_db" {
  name        = "bloom_db"
  description = "Allow inbound traffic for the database tier of our application"
  vpc_id      = module.vpc.vpc_id
}

resource "aws_security_group_rule" "bloom_db" {
  security_group_id = aws_security_group.bloom_db.id

  type        = "ingress"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "bloom_db_ssh" {
  security_group_id = aws_security_group.bloom_db.id

  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = var.db_ssh_security_group #Should be changed for security reasons
}