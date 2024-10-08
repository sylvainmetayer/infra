data "healthchecksio_channel" "signal" {
  kind = "signal"
}

resource "healthchecksio_check" "photoprism_backup" {
  name = "Photoprism Backup"
  desc = "Ensure backup of Photoprism did run at least once per day."

  tags = [
    "backup",
    "rasberrypi"
  ]

  timeout = 24 * 3600
  grace   = 3600
  channels = [
    data.healthchecksio_channel.signal.id
  ]
}

resource "healthchecksio_check" "nextcloud_backup" {
  name = "Nextcloud Backup"
  desc = "Ensure backup of Nextcloud did run at least once per day."

  tags = [
    "backup",
    "hetzner"
  ]

  timeout = 24 * 3600
  grace   = 3600
  channels = [
    data.healthchecksio_channel.signal.id
  ]
}

resource "healthchecksio_check" "wiki_backup" {
  name = "Wiki Backup"
  desc = "Ensure backup of Wiki did run at least once per day."

  tags = [
    "backup",
    "hetzner"
  ]

  timeout = 24 * 3600
  grace   = 3600
  channels = [
    data.healthchecksio_channel.signal.id
  ]
}

resource "healthchecksio_check" "rss_backup" {
  name = "RSS Backup"
  desc = "Ensure backup of RSS did run at least once per day."

  tags = [
    "backup",
    "hetzner"
  ]

  timeout = 24 * 3600
  grace   = 3600
  channels = [
    data.healthchecksio_channel.signal.id
  ]
}

resource "healthchecksio_check" "betisier_backup" {
  name = "Betisier Backup"
  desc = "Ensure backup of Betisier did run at least once per day."

  tags = [
    "backup",
    "betisier",
    "hetzner"
  ]

  timeout = 24 * 3600
  grace   = 3600
  channels = [
    data.healthchecksio_channel.signal.id
  ]
}

resource "healthchecksio_check" "betisier_reset" {
  name = "Betisier Reset"
  desc = "Ensure Betisier is reset each day"

  tags = [
    "betisier",
    "hetzner"
  ]

  timeout = 24 * 3600
  grace   = 3600
  channels = [
    data.healthchecksio_channel.signal.id
  ]
}

resource "healthchecksio_check" "monica_v4_cron" {
  name = "Monica v4 CRON"
  desc = "Ensure monica v4 cron run at least once per hour"

  tags = [
    "monica_v4",
    "hetzner"
  ]

  timeout = 1800
  grace   = 3600
  channels = [
    data.healthchecksio_channel.signal.id
  ]
}

resource "healthchecksio_check" "monica_v4_backup" {
  name = "monica_v4 Backup"
  desc = "Ensure backup of monica_v4 did run at least once per day."

  tags = [
    "backup",
    "monica_v4",
    "hetzner"
  ]

  timeout = 24 * 3600
  grace   = 3600
  channels = [
    data.healthchecksio_channel.signal.id
  ]
}

resource "healthchecksio_check" "signal_backup" {
  name = "Signal Backup"
  desc = "Folder Sync should backup everyday Signal Backup from my Pixel 7 to my kDrive"

  tags = [
    "backup",
    "signal",
    "kDrive"
  ]

  timeout = 24 * 3600
  grace   = 3600
  channels = [
    data.healthchecksio_channel.signal.id
  ]
}
