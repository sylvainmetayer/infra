moved {
  from = hcloud_server.nextcloud
  to   = hcloud_server.services
}

resource "hcloud_server" "services" {
  labels      = local.labels
  name        = "finch"
  image       = "debian-11"
  server_type = "cx32"
  location    = "hel1"
  keep_disk   = true
  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }
  ssh_keys = [hcloud_ssh_key.keepassxc.id]
  firewall_ids = [hcloud_firewall.firewall.id]
}
