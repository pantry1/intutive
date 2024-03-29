variable "cluster_name" {
  type = string
}

variable "region" {
  type = string
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

variable "oidc_provider_arn" {
  type = string
}

variable "vpc_id" {
  type = string
}
variable "secret_store_name" {
  type = string
}
variable "secret_store_arn" {
  type = string
}
variable "efs_id" {
  type = string
}
