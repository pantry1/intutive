output "cluster_id" {
  description = "EKS cluster ID."
  value       = module.eks.cluster_id
}

output "cluster_endpoint" {
  description = "Endpoint for EKS control plane."
  value       = module.eks.cluster_endpoint
}

output "cluster_security_group_id" {
  description = "Security group ids attached to the cluster control plane."
  value       = module.eks.cluster_security_group_id
}

output "cluster_certificate_authority_data" {
  description = "Base64 encoded certificate data required to communicate with the cluster"
  value       = module.eks.cluster_certificate_authority_data
}

output "region" {
  description = "AWS region"
  value       = var.region
}

output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = var.cluster_name
}

output "oidc_provider_arn" {
  description = "Kubernetes Cluster Name"
  value       = module.eks.oidc_provider_arn
}

data "aws_instances" "my_worker_nodes" {
  instance_tags = {
    "eks:cluster-name" = var.cluster_name
  }
  instance_state_names = ["running"]
}

output "eks_worker_nodes" {
  value = data.aws_instances.my_worker_nodes.private_ips
}

output "node_security_group_id" {
  value = module.eks.node_security_group_id
}

