variable "profile" {
  type    = string
  default = "svc-terraform"
}

variable "cluster_name" {
  type    = string
  default = "bitbucket-eks-cluster"
  #default = "testing-eks-2"
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "secret_arn" {
  type    = list(string)
  default = ["arn:aws:secretsmanager:us-east-1:998516096174:secret:SecretsStore-xanBIt"]
}

