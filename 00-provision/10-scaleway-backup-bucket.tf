resource "scaleway_account_project" "backup" {
  name = "backup"
}

resource "scaleway_iam_application" "backup" {
  name               = "backup"
  description        = "Backup Application"
}

resource "scaleway_object_bucket" "backup" {
  name               = "sylvain-backup"
  project_id         = scaleway_account_project.backup.id
  tags = {
    backup = "true"
    iac    = "OpenTofu"
  }
}

resource "scaleway_iam_policy" "backup" {
  name               = "s3 write object"
  description        = "Read/Write access to bucket in ${scaleway_account_project.backup.name} project"
  application_id     = scaleway_iam_application.backup.id
  rule {
    project_ids = [scaleway_account_project.backup.id]
    permission_set_names = ["ObjectStorageObjectsWrite", "ObjectStorageObjectsRead", "ObjectStorageObjectsDelete"]
  }
}

resource "scaleway_iam_api_key" "backup" {
  default_project_id = scaleway_account_project.backup.id
  application_id     = scaleway_iam_application.backup.id
  description        = "Backup"
}