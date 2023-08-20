variable "cluster_name" {}

variable "region" {}

variable "rds_driver" {
  default = "org.postgresql.Driver"
}

variable "nfs_mount_path" {
  default = "/nfsshare"
}

variable "bitbucket_pods_count" {
  default = 1
}

variable "private_subnets" {}

variable "elb_type" {}

variable "eks_endpoint" {}

variable "cluster_ca_certificate" {}

variable "eks_token" {}
variable "chart_status" {}

variable "secret_store_name" {}

variable "secret_store_arn" {}

variable "certificateARN" {}

variable "hosted_zone_id" {}