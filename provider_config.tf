# provider "uptimerobot" {}
provider "keepass" {}

provider "gandi" {
  key = data.keepass_entry.gandi_api_key.password
}

provider "hcloud" {
  token = data.keepass_entry.hetzner_token.password
}

provider "healthchecksio" {
  api_key = data.keepass_entry.healthcheck_api_key.password
}

provider "scaleway" {
  zone       = "fr-par-1"
  region     = "fr-par"
  access_key = data.keepass_entry.scaleway_api_key.username
  secret_key = data.keepass_entry.scaleway_api_key.password
}
