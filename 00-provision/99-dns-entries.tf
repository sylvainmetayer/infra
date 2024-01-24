resource "ovh_domain_zone_record" "nextcloud" {
  zone      = "sylvain.cloud"
  subdomain = ""
  fieldtype = "A"
  ttl       = 300
  target    = hcloud_server.nextcloud.ipv4_address
}
