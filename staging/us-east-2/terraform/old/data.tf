data "aws_route53_zone" "pgcloudapps" {
  name = "pgcloudapps.com."
}


# Find a certificate issued by (not imported into) ACM
data "aws_acm_certificate" "alb_cert" {
  domain      = "www.stage.pgcloudapps.com"
  types       = ["AMAZON_ISSUED"]
  most_recent = true
}