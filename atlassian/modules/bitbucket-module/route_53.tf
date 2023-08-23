data "aws_lb_hosted_zone_id" "alb" {}

data "aws_elb" "bitbucket-alb" {
  name = "bitbucket-alb"
}

#resource "aws_route53_record" "elb-route53" {
#  name    = "scm.mhbeaws.gov"
#  type    = "A"
#  zone_id                = var.hosted_zone_id
#  alias {
#    name                   = aws_elb.bitbucket-alb.dns_name
#    zone_id                = data.aws_elb_hosted_zone_id.alb.zone_id
#    evaluate_target_health = true
#  }
#}
