resource "scaleway_account_project" "wiki" {
  name = "wiki"
}

resource "scaleway_iam_application" "wiki" {
  name               = "wiki"
  description        = "Wiki Application"
}

resource "scaleway_object_bucket" "wiki" {
  name               = "bookstack-sylvain"
  project_id         = scaleway_account_project.wiki.id
  tags = {
    project = "wiki"
    iac    = "OpenTofu"
  }
  lifecycle_rule {
    enabled = true
    abort_incomplete_multipart_upload_days = 10
  }
}

resource "scaleway_iam_policy" "wiki" {
  name               = "wiki s3 write object"
  description        = "Read/Write access to bucket in ${scaleway_account_project.wiki.name} project"
  application_id     = scaleway_iam_application.wiki.id
  rule {
    project_ids = [scaleway_account_project.wiki.id]
    permission_set_names = ["ObjectStorageObjectsWrite", "ObjectStorageObjectsRead", "ObjectStorageObjectsDelete"]
  }
}

resource "scaleway_iam_api_key" "wiki" {
  default_project_id = scaleway_account_project.wiki.id
  application_id     = scaleway_iam_application.wiki.id
  description        = "Wiki"
}
