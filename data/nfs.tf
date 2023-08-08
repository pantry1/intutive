# Define the provider and region
provider "aws" {
  region  = var.region
  profile = var.profile
}

data "aws_ami" "debian11" {
  filter {
    name   = "name"
    values = ["debian-11-amd64-20230515-1381"]
  }
}

data "aws_availability_zones" "available" {}

resource "aws_security_group" "nfs-sg" {
  name   = "sg1-nfs-${var.cluster_name}"
  vpc_id = var.vpc_id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

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

resource "aws_instance" "nfs-server" {

  subnet_id                   = element(data.aws_subnets.private_subnets.ids,0)
  ami                         = data.aws_ami.debian11.image_id
  instance_type               = var.nfs_instance_type
  availability_zone           = data.aws_availability_zones.available.names[0]
  vpc_security_group_ids      = [aws_security_group.nfs-sg.id]
  key_name                    = aws_key_pair.pem.key_name
  associate_public_ip_address = false
  metadata_options {
    http_tokens = "required"
  }
  tags = {
    name                = "nfs-server"
    Name                = "nfs-server"
    cluster_name        = var.cluster_name
    terraform_workspace = terraform.workspace
  }

  root_block_device {
    volume_type = "gp2"
    volume_size = var.nfs_server_size
    encrypted   = true
  }

  lifecycle {
    postcondition {
      condition     = self.instance_state == "running"
      error_message = "EC2 instance must be running."
    }
  }
  user_data = <<-EOF
  #!/bin/bash
  echo "sleeping for 10 seconds" >> /tmp/user_data_script_output
  sleep 10
  echo "Running update command" >> /tmp/user_data_script_output
  sudo apt-get update -y 2>> /tmp/user_data_script_output
  echo "Running upgrade command" >> /tmp/user_data_script_output
  sudo DEBIAN_FRONTEND=noninteractive apt-get -yq upgrade 2>> /tmp/user_data_script_output
  echo "Installing NFS Server" >> /tmp/user_data_script_output
  sudo apt-get install nfs-kernel-server -yq 2>>  /tmp/user_data_script_output
  echo $? >> /tmp/user_data_script_output
  sudo hostnamectl set-hostname nfs-server
  PRIVATE_IP=$(ip -4 addr show ens5 | grep -oP 'inet \K[\d.]+')
  echo $PRIVATE_IP >> /tmp/user_data_script_output
  sudo sed -i '$a $PRIVATE_IP nfs-server' /etc/hosts
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