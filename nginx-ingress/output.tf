#
output "load-balancer-external" {
  value = data.kubernetes_service.nginx_ingress_lb
}
#
