locals {
  source_ips = [
    "0.0.0.0/0",
    "::/0"
  ]
}

resource "hcloud_firewall" "firewall" {
  name = "firewall"
  rule {
    direction  = "in"
    port       = 80
    protocol   = "tcp"
    source_ips = local.source_ips
  }
  rule {
    direction  = "in"
    protocol   = "tcp"
    port       = 443
    source_ips = local.source_ips
  }
  rule {
    direction  = "in"
    protocol   = "tcp"
    port       = 22
    source_ips = local.source_ips
  }
  rule {
    direction  = "in"
    protocol   = "icmp"
    source_ips = local.source_ips
  }
}
