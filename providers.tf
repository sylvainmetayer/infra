terraform {
  cloud {
    organization = "sylvainmetayer"
    workspaces {
      name = "infra"
    }
  }
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "<2.0.0"
    }
    ansiblevault = {
      source  = "MeilleursAgents/ansiblevault"
      version = "<3.0.0"
    }
    gandi = {
      source  = "go-gandi/gandi"
      version = "<3.0.0"
    }
    healthchecksio = {
      source  = "kristofferahl/healthchecksio"
      version = "<2.0.0"
    }
    keepass = {
      source  = "iSchluff/keepass"
      version = "<1.0.0"
    }
    # uptimerobot = {
    #   source = "louy/uptimerobot"
    # }
  }
  required_version = ">= 0.15"
}
