terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "<2.0.0"
    }
    gandi = {
      source  = "go-gandi/gandi"
      version = "<3.0.0"
    }
  }
}
