terraform {
  cloud {
    organization = "sylvainmetayer"
    workspaces {
      name = "infra"
    }
  }
  required_providers {
    # uptimerobot = {
    #   source = "louy/uptimerobot"
    # }
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "<2.0.0"
    }
    # healthchecksio = {
    #   source  = "kristofferahl/healthchecksio"
    #   version = "~> 1.9.0"
    # }
    gandi = {
      source  = "go-gandi/gandi"
      version = "~> 2.0.0"
    }
  }
  required_version = ">= 0.15"
}
