data "gandi_domain" "zone" {
  name = "sylvain.dev"
}

# VPS on Hetzner
# module "gibbs" {
#   source    = "./modules/gibbs"
# }
#
# module "ansible_inventory" {
#   source    = "./modules/ansible_inventory"
#   server_ip = module.gibbs.server_ip
# }

# resource "gandi_livedns_record" "rss" {
#   zone = data.gandi_domain.zone.id
#   name = data.keepass_entry.rss_domain.url
#   type = "A"
#   ttl  = 300
#   values = [
#     module.gibbs.server_ip
#   ]
# }

# data "healthchecksio_channel" "signal" {
#   kind = "signal"
# }

# module "android" {
#   source                 = "./modules/android"
#   healthcheck_channel_id = data.healthchecksio_channel.signal.id
# }

# module "backup" {
#   source = "./modules/backup"
# }

# output "gibbs_ip" {
#   value = module.gibbs.server_ip
# }
