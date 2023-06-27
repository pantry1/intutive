variable "profile" {
  type    = string
  default = "svc-terraform"
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "vpc_id" {
  default = "vpc-062b787ae2d5c4740"
}

variable "nfs_instance_type" {
  default = "t3.xlarge"
}

variable "nfs_server_size" {
  default = "50"
}

variable "public_subnet_id" {
  #type = list
  default = "subnet-0a30aab2c4b901a67"
}

variable "node_security_group_id" {
  default = "sg-0cb928db68b1c893a"
}

variable "db_username" {
  default = "foo"
}

variable "db_password" {
  default = "foobarbaz"
}

variable "db_instance_type" {
  default = "db.t3.micro"
}

variable "cluster_name" {
  type    = string
  default = "bitbucket-eks-cluster"
}