variable "cluster_name" {
  type    = string
}

variable "region" {
  type    = string
}

variable "rds_driver" {
  default = "org.postgresql.Driver"
}

variable "nfs_mount_path" {
  default = "/nfsshare"
}

variable "bitbucket_pods_count" {
  default = 1
}

variable "private_subnets" {
}

variable "elb_type" {
}

variable "eks_endpoint" {
  type = string
}

variable "cluster_ca_certificate" {
  type = string
}

variable "eks_token" {
  type = string
}
variable "chart_status" {

}

variable "secret_store_name" {
  type = string
}
variable "secret_store_arn" {

}
