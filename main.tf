data "gandi_domain" "zone" {
  name = "sylvain.dev"
}

# VPS on Hetzner
module "gibbs" {
  source    = "./modules/gibbs"
  domain_id = data.gandi_domain.zone.id
  subdomain = "gibbs.demo"
}

module "ansible_inventory" {
  source    = "./modules/ansible_inventory"
  server_ip = module.gibbs.server_ip
}

module "rss" {
  source    = "./modules/rss"
  domain_id = data.gandi_domain.zone.id
  server_ip = module.gibbs.server_ip
  subdomain = data.keepass_entry.rss_domain.url
}

data "healthchecksio_channel" "signal" {
  kind = "signal"
}

module "android" {
  source                 = "./modules/android"
  healthcheck_channel_id = data.healthchecksio_channel.signal.id
}

module "backup" {
  source = "./modules/backup"
}

output "gibbs_ip" {
  value = module.gibbs.server_ip
}
