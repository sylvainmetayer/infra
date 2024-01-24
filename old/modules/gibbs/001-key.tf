resource "hcloud_ssh_key" "keepassxc" {
  name       = "keepassxc"
  public_key = file("${path.root}/key.pub")
}
