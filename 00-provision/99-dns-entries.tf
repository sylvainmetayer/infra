resource "ovh_domain_zone_record" "nextcloud" {
  zone      = "sylvain.cloud"
  subdomain = ""
  fieldtype = "A"
  ttl       = 300
  target    = hcloud_server.nextcloud.ipv4_address
}

data "http" "home_ip" {
  url = "https://ipv4.icanhazip.com"
}

locals {
  home_ip = "176.129.128.50"
}

resource "ovh_domain_zone_record" "photos" {
  zone      = "sylvain.cloud"
  subdomain = "photos"
  fieldtype = "A"
  ttl       = 300
  #target    = chomp(data.http.home_ip.response_body)
  target    = local.home_ip
}
