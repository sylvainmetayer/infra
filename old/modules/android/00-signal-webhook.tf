resource "healthchecksio_check" "signal" {
  lifecycle {
    prevent_destroy = true
  }

  name = "signal-backup"
  desc = "Folder Sync should backup everyday Signal Backup from my Motorola One Hyper to my kDrive"

  tags = [
    "backup",
    "signal",
    "kDrive",
  ]

  channels = [
    var.healthcheck_channel_id
  ]

  timeout = 86400
  grace   = 3600 # seconds
}