resource "scaleway_object_bucket" "backup" {
  name = "backup-infra-sylvain"
  acl  = "private"
  tags = {
    iac = "terraform"
  }
}