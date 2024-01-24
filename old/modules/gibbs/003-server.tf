resource "hcloud_server" "server" {
  name        = "gibbs"
  image       = var.server_image
  server_type = var.server_type
  location    = var.region
  keep_disk   = true
  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }
  ssh_keys     = [hcloud_ssh_key.keepassxc.id]
  firewall_ids = [hcloud_firewall.firewall.id]
}
