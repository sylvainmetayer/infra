# provider "healthchecksio" {}
# provider "uptimerobot" {}

# provider "gandi" {}


provider "hcloud" {}

# VPS on Hetzner
module "gibbs" {
  source = "./modules/gibbs"
}

module "ansible_inventory" {
  source    = "./modules/ansible_inventory"
  server_ip = module.gibbs.server_ip
}
