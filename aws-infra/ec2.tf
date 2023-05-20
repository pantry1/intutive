# Security Group
resource "aws_security_group" "main" {
  vpc_id = aws_vpc.main.id
  description = "Security group for EC2 instances"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.10.0.0/28"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "ec2" {
  count         = var.instance_count
  ami           = var.ami_id  # Replace with your desired AMI ID
  instance_type = "t2.micro"  # variablize the instance type to change the instance_type
  subnet_id     = aws_subnet.public.id

  root_block_device {
    volume_size = 8
    encrypted   = true
  }
  
  metadata_options {
    http_tokens = "required"
  }

  disable_api_termination = true

  tags = {
    Name = "EC2-${count.index}"
  }

  vpc_security_group_ids = [aws_security_group.main.id]

  ebs_block_device {
    device_name           = "/dev/sdh"
    volume_type           = "gp2"
    volume_size           = 10
    delete_on_termination = true
  }
}
