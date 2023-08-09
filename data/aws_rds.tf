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
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
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
  depends_on                          = [random_string.db_password]
  allocated_storage                   = var.db_size
  identifier                          = "atlassian-rds-${var.cluster_name}"
  engine                              = "postgres"
  engine_version                      = "14"
  instance_class                      = var.db_instance_type
  username                            = var.db_username
  password                            = random_string.db_password.result
  backup_retention_period             = 7
  backup_window                       = "03:00-04:00"
  multi_az                            = true
  storage_encrypted                   = true
  db_name                             = "bitbucket"
  skip_final_snapshot                 = true
  copy_tags_to_snapshot               = true
  final_snapshot_identifier           = "atlassian-db"
  db_subnet_group_name                = aws_db_subnet_group.default.id
  vpc_security_group_ids              = [aws_security_group.rds-sg.id]
  iam_database_authentication_enabled = true
  tags = {
    cluster_name        = var.cluster_name
    terraform_workspace = terraform.workspace
  }
}

resource "aws_sns_topic" "db_events" {
  name = "rds-events-topic"

  tags = {
    cluster_name        = var.cluster_name
    terraform_workspace = terraform.workspace
  }
}

resource "aws_db_event_subscription" "default" {
  name      = "rds-event-sub"
  sns_topic = aws_sns_topic.db_events.arn

  source_type = "db-instance"
  source_ids  = [aws_db_instance.default.identifier]

  event_categories = [
    "availability",
    "deletion",
    "failover",
    "failure",
    "low storage",
    "maintenance",
    "notification",
    "read replica",
    "recovery",
    "restoration",
  ]
  tags = {
    cluster_name        = var.cluster_name
    terraform_workspace = terraform.workspace
  }
}