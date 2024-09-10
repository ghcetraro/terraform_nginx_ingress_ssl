#
data "kubernetes_service" "nginx_ingress_lb" {
  metadata {
    name      = "nginx-ingress-controller"
    namespace = "nginx-ingress"
  }
  depends_on = [
    helm_release.nginx_ingress
  ]
}
#
data "aws_elb" "nginx_ingress_lb" {
  name = split("-", data.kubernetes_service.nginx_ingress_lb.status.0.load_balancer.0.ingress.0.hostname)[0]
  depends_on = [
    helm_release.nginx_ingress
  ]
}