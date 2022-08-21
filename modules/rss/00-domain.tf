resource "gandi_livedns_record" "rss" {
  zone = var.domain_id
  name = var.subdomain
  type = "A"
  ttl  = 300
  values = [
    var.server_ip
  ]
}