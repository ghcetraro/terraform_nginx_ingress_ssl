## Public Zone Records for the EKS ingress
resource "aws_route53_record" "nginx_public_zone_record" {
  zone_id = local.dns.zone_id
  name    = local.dns.name
  type    = "A"
  alias {
    name                   = data.aws_elb.nginx_ingress_lb.dns_name
    zone_id                = data.aws_elb.nginx_ingress_lb.zone_id
    evaluate_target_health = true
  }
  #
  depends_on = [
    helm_release.nginx_ingress
  ]
}
## Public Wildcards
resource "aws_route53_record" "nginx_public_wildcard_record" {
  zone_id  = local.dns.zone_id
  name     = "*"
  type     = "CNAME"
  ttl      = "60"
  records  = [data.kubernetes_service.nginx_ingress_lb.status.0.load_balancer.0.ingress.0.hostname]
  provider = aws.devops_shared_us_east_1
  #
  depends_on = [
    helm_release.nginx_ingress
  ]
}
