variable "scaleway_organization_id" {
  type     = string
  nullable = false
}

variable "scaleway_provider_access_key" {
  type      = string
  nullable  = false
  sensitive = true
}

variable "scaleway_provider_secret_key" {
  type      = string
  nullable  = false
  sensitive = true
}

variable "gandi_pat" {
  type      = string
  nullable  = false
  sensitive = true
}

variable "healthchecks_io_api_key" {
  type      = string
  nullable  = false
  sensitive = true
}