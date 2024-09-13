data "gandi_domain" "zone" {
  name = "sylvain.dev"
}

# resource "gandi_livedns_record" "betisier" {
#   zone = data.gandi_domain.zone.id
#   name = "betisier"
#   type = "A"
#   ttl  = 300
#   values = [
#     hcloud_server.services.ipv4_address
#   ]
# }

resource "gandi_livedns_record" "monica_v4" {
  zone = data.gandi_domain.zone.id
  name = "crm"
  type = "A"
  ttl  = 300
  values = [
    hcloud_server.services.ipv4_address
  ]
}
