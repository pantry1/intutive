data "aws_eks_cluster" "example" {
  depends_on = [module.eks_cluster]
  name       = var.cluster_name
}

data "aws_caller_identity" "current" {}

data "aws_eks_cluster_auth" "cluster" {
  depends_on = [module.eks_cluster]
  name       = var.cluster_name
}

data "aws_secretsmanager_secret" "secret_store" {
  name = "SecretStore-${var.cluster_name}"
}

data "aws_efs_file_system" "fs_id" {
  tags = {
      Name = "efs-nexus"
      eks-cluster = var.cluster_name
  }
}
