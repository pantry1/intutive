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

variable "nfs_instance_type" {
  default = "t2.small"
}

variable "nfs_server_size" {
  default = "20"
}

variable "public_subnet_id" {
  default = "subnet-03b362bbc29eedb1d"
}

variable "node_security_group_id" {
  default = "sg-02e8b82aa8e5dbe10"
}

variable "db_instance_type" {
  default = "db.t3.micro"
}

variable "cluster_name" {
  type    = string
  default = "bitbucket-cluster"
}

variable "db_size" {
  default = 5
}

######  USERNAME AND OTHER DETAILS
variable "db_username" {
  default = "foo"
}

variable "es_username" {
  default = "elastic"
}

variable "bitbucket_username" {
  default = "admin"
}

variable "bitbucket_displayNamen" {
  default = "Admin"
}

variable "bitbucket_emailAddress" {
  default = "test@gmail.com"
}