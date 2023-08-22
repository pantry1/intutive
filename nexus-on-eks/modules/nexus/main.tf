resource "helm_release" "nexus" {
  name             = "nexus"
  repository       = "https://stevehipwell.github.io/helm-charts/"
  chart            = "nexus3"
  version          = "4.32.1"
  namespace        = "nexus"
  create_namespace = true

  set {
    name  = "service.type"
    value = "NodePort"
  }
  set {
    name  = "ingress.enabled"
    value = true
  }
  set {
    name  = "ingress.annotations.alb\\.ingress\\.kubernetes\\.io/subnets"
    value = var.private_subnets
  }
  set {
    name  = "ingress.annotations.alb\\.ingress\\.kubernetes\\.io/scheme"
    value = var.elb_scheme
  }
  set {
    name  = "ingress.annotations.alb\\.ingress\\.kubernetes\\.io/load-balancer-name"
    value = "nexus-load-balancer"
  }
  set {
    name  = "ingress.ingressClassName"
    value = "alb"
  }
  set {
    name  = "persistence.enabled"
    value = true
  }
  set {
    name  = "ingress.hosts[0]"
    value = ""
  }
  set {
    name  = "persistence.size"
    value = "8Gi"
  }
  set {
    name  = "persistence.storageClass"
    value = "aws-efs"
  }
}