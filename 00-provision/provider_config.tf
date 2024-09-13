provider "hcloud" {}
provider "ovh" {
  endpoint = "ovh-eu"
}

provider "scaleway" {
  organization_id = var.scaleway_organization_id
  access_key      = var.scaleway_provider_access_key
  secret_key      = var.scaleway_provider_secret_key
}

provider "healthchecksio" {
  api_key = var.healthchecks_io_api_key
}

provider "gandi" {
  personal_access_token = var.gandi_pat
}
