#
resource "kubernetes_namespace" "cert" {
  metadata {
    annotations = {}
    labels      = {}
    name        = "cert-manager"
  }
}

# Deploy cert-manager
resource "helm_release" "cert" {
  name       = "cert-manager"
  namespace  = kubernetes_namespace.cert.metadata[0].name
  repository = "https://charts.jetstack.io"
  version    = "1.14.4"
  chart      = "cert-manager"
  set {
    name  = "version"
    value = "v1.4.0"
  }
  set {
    name  = "installCRDs"
    value = "true"
  }
  depends_on = [
    aws_iam_role.cert_manager
  ]
}

resource "kubectl_manifest" "cert_manager_cluster_issuer_prod" {
  yaml_body = templatefile("${path.module}/manifests/cluster-issuer.yml", {
    cluster_name = local.app_name_dashed
  })
  depends_on = [helm_release.cert]
}