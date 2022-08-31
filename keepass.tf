
data "keepass_entry" "healthcheck_api_key" {
  path = "Racine/infra/healthchecks-api-key"
}

data "keepass_entry" "hetzner_token" {
  path = "Racine/infra/hetzner-token"
}

data "keepass_entry" "gandi_api_key" {
  path = "Racine/infra/gandi-api-key"
}

data "keepass_entry" "rss_domain" {
  path = "Racine/infra/ansible/rss-domain"
}

data "keepass_entry" "scaleway_api_key" {
  path = "Racine/infra/scaleway-api-key"
}
