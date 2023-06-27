variable "profile" {
  type    = string
  default = "svc-terraform"
}

variable "cluster_name" {
  type    = string
  default = "bitbucket-eks-cluster"
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "cluster_version" {
  type    = string
  default = "1.27"
}

variable "instance_type" {
  type    = string
  default = "t3.xlarge"
}

variable "nodes_count" {
  type    = string
  default = "0"
}

variable "vpc_id" {
  default = "vpc-062b787ae2d5c4740"
}

variable "private_subnet_ids" {
  default = ["subnet-024c6fbfc46823b4f","subnet-07368f3642e5429e2"]  
}

variable "public_subnet_id" {
  #type = list
  default = "subnet-0a30aab2c4b901a67"
}