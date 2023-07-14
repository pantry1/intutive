resource "time_sleep" "wait_45_seconds" {
  create_duration = "45s"
  depends_on = [var.eks_endpoint]
}

resource "kubectl_manifest" "secret-store" {
  depends_on = [time_sleep.wait_45_seconds]
  yaml_body = templatefile("${path.module}/files/secretstore.yaml", { REGION = var.region })
}
