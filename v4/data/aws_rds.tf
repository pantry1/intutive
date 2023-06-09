data "aws_subnets" "private_subnets" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
  filter {
    name   = "tag:Name"
    values = ["*private*"]
  }
}

resource "aws_security_group" "rds-sg" {
  name   = "sg1-rds-bitbucket-${var.cluster_name}"
  vpc_id = var.vpc_id
  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    cidr_blocks      = ["10.0.0.0/8"]    
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_subnet_group" "default" {
  name       = "rds-subnet-group-${var.cluster_name}"
  subnet_ids = data.aws_subnets.private_subnets.ids
}


resource "aws_db_instance" "default" {
  depends_on = [ random_string.db_password ]
  allocated_storage   = var.db_size
  identifier = "bitbucket-rds-${var.cluster_name}"
  engine              = "postgres"
  engine_version      = "14"
  instance_class      = var.db_instance_type
  username            = var.db_username
  password            = random_string.db_password.result
  db_name             = "bitbucket"
  skip_final_snapshot = true
  #storage_type = "gp3"
  final_snapshot_identifier = "bitbucket-db"
  db_subnet_group_name      = aws_db_subnet_group.default.id
  vpc_security_group_ids    = [aws_security_group.rds-sg.id]
}

