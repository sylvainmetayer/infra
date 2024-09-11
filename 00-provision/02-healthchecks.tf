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
