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
  default = "t3.xlarge"
}

variable "nfs_server_size" {
  default = "50"
}

variable "db_instance_type" {
  default = "db.t3.micro"
}

variable "cluster_name" {
  type    = string
  default = "atlassian-cluster-4"
}

variable "db_size" {
  default = 10
}

######  USERNAME AND OTHER DETAILS
variable "db_username" {
  default = "postgres"
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