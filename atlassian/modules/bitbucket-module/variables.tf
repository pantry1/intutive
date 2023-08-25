variable "cluster_name" {}

variable "region" {}

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

variable "rds_driver" {
  default = "org.postgresql.Driver"
}

variable "bitbucket_pods_count" {
  default = 1
}