variable "profile" {
  type    = string
  default = "svc-terraform"
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
  default = "2"
}

variable "vpc_id" {
  default = "vpc-0f851beb2ba287c51"
}

variable "private_subnets" {
  # default = "subnet-073a5d0b35e22e05d\\, subnet-03ce94c2a2af0a2aa\\, subnet-072b3186da6c8e27d"
  default = "subnet-03b362bbc29eedb1d\\,subnet-061789e4cfa639907\\, subnet-0a2fe503d22d48b0a"
  # example: "subnet-XXXX\\, subnet-xxxxx"
}

variable "cluster_name" {
  type    = string
  default = "nexus-cluster-4"
}

variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "elb_scheme" {
  type    = string
  default = "internet-facing"
}

variable "hosted_zone_id" {
  type    = string
  default = "Z02258442IWESMF43UXWZ"
}