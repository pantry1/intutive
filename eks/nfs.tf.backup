data "aws_ami" "debian11" {
  filter {
    name   = "name"
    values = ["debian-11-amd64-20230515-1381"]
  }
}

resource "aws_security_group" "nfs-sg" {
  name   = "sg1-rds-${var.region}"
  vpc_id = var.vpc_id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = -1
    security_groups = [module.eks.node_security_group_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "pem" {
  key_name   = "nfs-server-${var.region}"
  public_key = tls_private_key.pk.public_key_openssh
}

resource "local_file" "local_key_pair" {
  filename        = "../pem/${aws_key_pair.pem.key_name}.pem"
  file_permission = "0400"
  content         = tls_private_key.pk.private_key_pem
}

data "aws_instances" "my_worker_nodes" {
  instance_tags = {
    "eks:cluster-name" = var.cluster_name
  }
  instance_state_names = ["running"]
}



resource "aws_instance" "nfs-server" {

  subnet_id                   = var.public_subnet_id
  ami                         = data.aws_ami.debian11.image_id
  instance_type               = var.nfs_instance_type
  availability_zone           = data.aws_availability_zones.available.names[0]
  vpc_security_group_ids      = [aws_security_group.nfs-sg.id]
  key_name                    = aws_key_pair.pem.key_name
  associate_public_ip_address = true
  tags = {
    name = "nfs-server"
  }

  root_block_device {
    volume_type = "gp2"
    volume_size = var.nfs_server_size
  }

  lifecycle {
    postcondition {
      condition     = self.instance_state == "running"
      error_message = "EC2 instance must be running."
    }
  }
  user_data = <<-EOF
  #!/bin/bash
  sudo apt-get update -y
  sudo apt-get install nfs-kernel-server -y
  mkdir /nfsshare
  chown nobody:nogroup /nfsshare
  chmod 777 /nfsshare  
  sudo systemctl enable rpc-statd 
  sudo systemctl start rpc-statd  
  sudo systemctl enable rpcbind 
  sudo systemctl start rpcbind 
  cat <<EXPORTS-EOT > /etc/exports
  /nfsshare    10.0.0.0/8(rw,sync,no_subtree_check)
  EXPORTS-EOT
  systemctl restart nfs-server
  EOF
}