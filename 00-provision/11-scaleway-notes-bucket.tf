resource "scaleway_account_project" "notes" {
  name = "notes"
}

resource "scaleway_iam_application" "notes" {
  name               = "notes"
  description        = "Notes S3 sync"
}

resource "scaleway_object_bucket" "notes" {
  name               = "sylvain-obsidian-notes"
  project_id         = scaleway_account_project.notes.id
  tags = {
    iac    = "OpenTofu"
  }
}

resource "scaleway_iam_policy" "notes" {
  name               = "s3 notes write object"
  description        = "Read/Write access to bucket in ${scaleway_account_project.notes.name} project"
  application_id     = scaleway_iam_application.notes.id
  rule {
    project_ids = [scaleway_account_project.notes.id]
    permission_set_names = ["ObjectStorageObjectsWrite", "ObjectStorageObjectsRead", "ObjectStorageObjectsDelete"]
  }
}

resource "scaleway_iam_api_key" "notes" {
  default_project_id = scaleway_account_project.notes.id
  application_id     = scaleway_iam_application.notes.id
  description        = "Notes"
}