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

locals {
  data = yamldecode(file("ansible/secrets.vault.yml"))
}

data "gandi_domain" "zone" {
  name = local.data["root_domain"]
}

# VPS on Hetzner
module "gibbs" {
  source = "./modules/gibbs"
}

module "ansible_inventory" {
  source    = "./modules/ansible_inventory"
  server_ip = module.gibbs.server_ip
}

module "rss" {
  source    = "./modules/rss"
  domain_id = data.gandi_domain.zone.id
  server_ip = module.gibbs.server_ip
  subdomain = local.data["rss_subdomain"]
}

data "healthchecksio_channel" "signal" {
  kind = "signal"
}

module "android" {
  source                 = "./modules/android"
  healthcheck_channel_id = data.healthchecksio_channel.signal.id
}
