variable "profile" {
  type    = string
  default = "svc-terraform"
}

variable "cluster_name" {
  type    = string
  default = "bitbucket-cluster"
}

variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "rds_endpoint" {
  default = "bitbucket-rds-bitbucket-cluster.cmlkd6hzxk08.ap-south-1.rds.amazonaws.com:5432"
}

variable "rds_driver" {
  default = "org.postgresql.Driver"
}

variable "nfs_server" {
  default = "10.0.4.84"
}

variable "nfs_mount_path" {
  default = "/nfsshare"
}

variable "bitbucket_pods_count" {
  default = 1
}

variable "secretStoreName" {
  default = "SecretStore-bitbucket-cluster"
}

variable "private_subnets" {
  default = "subnet-073a5d0b35e22e05d\\, subnet-03ce94c2a2af0a2aa"
  # example: "subnet-XXXX\\, subnet-xxxxx"
}


variable "elb_type" {
  default = "internal" #it can be internet-facing
}
