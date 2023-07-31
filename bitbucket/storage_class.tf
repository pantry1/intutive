resource "kubernetes_storage_class" "fast_storage_class" {
  metadata {
    name = "fast"
  }
  storage_provisioner = "ebs.csi.aws.com"
  reclaim_policy      = "Retain"
  parameters = {
    type = "gp3"
    allowAutoIOPSPerGBIncrease : "true"
    encrypted : "true"
  }
  allow_volume_expansion = "true"
  volume_binding_mode    = "WaitForFirstConsumer"
}

resource "kubernetes_storage_class" "gp2_storage_class" {
  metadata {
    name = "gp2-encrypted"
  }
  storage_provisioner = "ebs.csi.aws.com"
  reclaim_policy      = "Retain"
  parameters = {
    type = "gp2"
    allowAutoIOPSPerGBIncrease : "true"
    encrypted : "true"
  }
  allow_volume_expansion = "true"
  volume_binding_mode    = "WaitForFirstConsumer"
}
