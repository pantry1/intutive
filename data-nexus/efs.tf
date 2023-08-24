data "aws_availability_zones" "available" {}

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

resource "aws_efs_file_system" "efs-nexus" {
  creation_token   = "efs-${var.cluster_name}"
  performance_mode = "generalPurpose"
  throughput_mode  = "bursting"
  encrypted        = "true"
  tags = {
    Name        = "efs-nexus"
    eks-cluster = var.cluster_name
  }
}

resource "aws_security_group" "efs-sg" {
  name   = "sg1-efs-${var.cluster_name}"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["10.0.0.0/8"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_efs_mount_target" "efs-mount" {
  count           = length(data.aws_subnets.private_subnets.ids)
  file_system_id  = aws_efs_file_system.efs-nexus.id
  subnet_id       = element(data.aws_subnets.private_subnets.ids, count.index)
  security_groups = [aws_security_group.efs-sg.id]
}