output "healthcheck_ids" {
  value = {
    nextcloud: healthchecksio_check.nextcloud_backup.ping_url
    photoprism: healthchecksio_check.photoprism_backup.ping_url
    signal: healthchecksio_check.signal_backup.ping_url
    wiki: healthchecksio_check.wiki_backup.ping_url
    rss: healthchecksio_check.rss_backup.ping_url
  }
}

output "backup_api_key" {
  sensitive = true
  value = {
    access_key : scaleway_iam_api_key.backup.access_key
    secret_key : scaleway_iam_api_key.backup.secret_key
    bucket_endpoint : scaleway_object_bucket.backup.api_endpoint
    bucket : scaleway_object_bucket.backup.name
    bucket_region : scaleway_object_bucket.backup.region
  }
}
