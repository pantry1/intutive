# output "cluster_id" {
#   description = "EKS cluster ID."
#   value       = module.eks.cluster_id
# }

# output "cluster_endpoint" {
#   description = "Endpoint for EKS control plane."
#   value       = module.eks.cluster_endpoint
# }

# output "cluster_security_group_id" {
#   description = "Security group ids attached to the cluster control plane."
#   value       = module.eks.cluster_security_group_id
# }

# # output "aws_auth_configmap_yaml" {
# #    description = "Formatted yaml output for base aws-auth configmap containing roles used in cluster node groups/fargate profiles"
# #    value       = module.eks.aws_auth_configmap_yaml
# # }

# output "cluster_certificate_authority_data" {
#   description = "Base64 encoded certificate data required to communicate with the cluster"
#   value       = module.eks.cluster_certificate_authority_data
# }

# output "region" {
#   description = "AWS region"
#   value       = var.region
# }

# output "cluster_name" {
#   description = "Kubernetes Cluster Name"
#   value       = var.cluster_name
# }

output "endpoint" {
  value = data.aws_eks_cluster.example.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = data.aws_eks_cluster.example.certificate_authority[0].data
}
