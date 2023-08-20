variable "profile" {
  type    = string
  default = "svc-terraform"
}

variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "vpc_id" {
  default = "vpc-0f851beb2ba287c51"
}

variable "public_subnet_id" {
  default = "subnet-03b362bbc29eedb1d"
}

variable "db_instance_type" {
  default = "db.t3.micro"
}

variable "cluster_name" {
  type    = string
  default = "nexus-cluster-3"
}


