#
resource "kubernetes_namespace" "nginx_ingress" {
  metadata {
    annotations = {}
    labels      = {}
    name        = "nginx-ingress"
  }
}
#
resource "helm_release" "nginx_ingress" {
  name         = "nginx-ingress"
  namespace    = kubernetes_namespace.nginx_ingress.metadata[0].name
  repository   = "https://kubernetes.github.io/ingress-nginx"
  chart        = "ingress-nginx"
  version      = "4.11.2"
  atomic       = true
  reset_values = true
  timeout      = 900
  values = [
    templatefile("${path.module}/manifests/nginx_ingress_values.tpl.yml", {})
  ]
  depends_on = [
    kubernetes_namespace.nginx_ingress,
    module.kubernetes_secret
  ]
}