# Database Subnet Group

resource "aws_db_subnet_group" "bloom_db" {
    name = "db"
    subnet_ids = module.vpc.database_subnets

    tags = {
      Terraform = "true"
      Environment = var.environment
    }
}

resource "aws_security_group" "bloom_rds" {
    name = "rds"
    description = "Allow inbound traffic for db tier"
    vpc_id = module.vpc.vpc_id

    tags = {
      Terraform = "true"
      Environment = var.environment
    }
}

resource "aws_security_group_rule" "bloom_rds" {
    security_group_id = aws_security_group.bloom_rds.id

    type = "ingress"
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = var.db_sgr
}

resource "random_password" "bloom_db_password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

# RDS Instance
resource "aws_db_instance" "bloom_instance" {
    allocated_storage = 20
    storage_type = "gp2"
    engine = "mysql"
    engine_version = "8.0"
    instance_class = var.db_instance_class
    db_name = "bloom_mysql"
    username = var.db_username
    password = random_password.bloom_db_password.result
    db_subnet_group_name = aws_db_subnet_group.bloom_db.name
    vpc_security_group_ids = [aws_security_group.bloom_rds.id]

    multi_az = var.multi_az

    availability_zone = "us-east-1a"

    backup_retention_period = 7
    skip_final_snapshot = true

    tags = {
      Terraform = "true"
      Environment = var.environment
    }
}