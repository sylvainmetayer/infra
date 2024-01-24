locals {
  source_ips = [
    "0.0.0.0/0",
    "::/0"
  ]
  labels = {
    iac = "opentofu"
  }
}

resource "hcloud_ssh_key" "keepassxc" {
  labels = local.labels
  name   = "keepassxc"
  public_key = file("${path.root}/../key.pub")
}

resource "hcloud_firewall" "firewall" {
  name   = "firewall"
  labels = local.labels
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
