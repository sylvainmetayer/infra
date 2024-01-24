resource "scaleway_object_bucket" "backup" {
  name = "backup-infra-sylvain"
  tags = {
    iac = "terraform"
  }
}

resource "scaleway_object_bucket_acl" "main" {
  bucket = scaleway_object_bucket.backup.name
  acl    = "private"
}
