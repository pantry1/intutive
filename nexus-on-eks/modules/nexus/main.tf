resource "helm_release" "nexus" {
  name             = "nexus"
  repository       = "https://stevehipwell.github.io/helm-charts/"
  chart            = "nexus3"
  version          = "4.32.1"
  namespace        = "nexus"
  create_namespace = true

  set {
    name  = "service.type"
    value = "LoadBalancer"
  }
  set {
    name  = "service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-subnets"
    value = var.private_subnets
  }
}