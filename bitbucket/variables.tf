variable "profile" {
  type    = string
  default = "svc-terraform"
}

variable "cluster_name" {
  type = string
  default = "bitbucket-eks-cluster"
  #default = "testing-eks-2"
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "rds_endpoint" {
  default = "terraform-20230626174106064100000001.ckgzwdri9ctj.us-east-1.rds.amazonaws.com:5432"
}

variable "rds_driver" {
  default = "org.postgresql.Driver"
}

variable "nfs_server" {
  default = "10.0.4.28"
}

variable "nfs_mount_path" {
  default = "/nfsshare"
}

variable "db_username" {
  default = "foo"
}

variable "db_password" {
  default = "foobarbaz"
}

variable "es_username" {
  default = "elastic"
}

variable "es_password" {
  default = "6b#J4T7m&DJp"
}

variable "bitbucket_pods_count" {
  default = 2
}

variable "secretStoreName" {
  default = "SecretsStore"
}