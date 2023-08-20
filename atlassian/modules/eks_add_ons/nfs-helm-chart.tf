resource "helm_release" "nfs" {
  name             = "nfs-server"
  repository       = "https://charts.obeone.cloud"
  chart            = "nfs-server"
  version          = "1.1.2"
  namespace        = "nfs"
  create_namespace = true

  set {
    name  = "env.NFS_EXPORT_0"
    value = "/nfsshare    10.0.0.0/8(rw\\,sync\\,no_subtree_check)"
  }
  set {
    name  = "service.main.type"
    value = "NodePort"
  }
  set {
    name  = "service.udp.type"
    value = "NodePort"
  }
  set {
    name  = "persistence.shared.mountPath"
    value = "/nfsshare"
  }
}