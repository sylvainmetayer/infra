resource "gandi_livedns_record" "server" {
  zone   = var.domain_id
  name   = var.subdomain
  type   = "A"
  ttl    = 300
  values = [
    hcloud_server.server.ipv4_address
  ]
}