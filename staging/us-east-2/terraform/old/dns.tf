# resource "aws_route53_record" "www_test" {
#   zone_id = data.aws_route53_zone.pgcloudapps.zone_id
#   name    = "www.${data.aws_route53_zone.pgcloudapps.name}"
#   type    = "A"
#   ttl     = "300"
#   records = ["10.35.0.1"]
# }

resource "aws_route53_record" "www_stage" {
  zone_id = data.aws_route53_zone.pgcloudapps.zone_id
  name    = "www.${var.staging-env}.pgcloudapps.com"
  type    = "A"
  ttl     = "300"
  records = ["10.35.0.1"]
}

resource "aws_route53_record" "stage" {
  zone_id = data.aws_route53_zone.pgcloudapps.zone_id
  name    = "${var.staging-env}.pgcloudapps.com"
  type    = "A"
  ttl     = "300"
  records = ["10.35.0.2"]
}