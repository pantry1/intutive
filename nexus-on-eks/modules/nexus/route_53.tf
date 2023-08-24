data "aws_lb_hosted_zone_id" "alb" {}

data "aws_lb" "bitbucket-alb" {
  depends_on = [helm_release.nexus]
  name       = "nexus-load-balancer"
}


#resource "aws_route53_record" "elb-route53" {
#  name    = "scm.mhbeaws.gov"
#  type    = "A"
#  zone_id                = var.hosted_zone_id
#  alias {
#    name                   = aws_lb.bitbucket-alb.dns_name
#    zone_id                = data.aws_lb_hosted_zone_id.alb.zone_id
#    evaluate_target_health = true
#  }
#}


output "alb_dns" {
  value = data.aws_lb.bitbucket-alb.dns_name
}