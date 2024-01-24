terraform {
  backend "s3" {
    # https://www.scaleway.com/en/blog/terraform-how-to-init-your-infrastructure/
    bucket   = "tf-backend-state"
    key      = "infra.tfstate"
    region                      = "fr-par"
    endpoint                    = "https://s3.fr-par.scw.cloud"
    skip_region_validation      = true
    skip_credentials_validation = true
  }

  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "<2.0.0"
    }
    ovh = {
      source  = "ovh/ovh"
      version = "<1.0.0"
    }
    healthchecksio = {
      source  = "kristofferahl/healthchecksio"
      version = "<2.0.0"
    }
    scaleway = {
      source  = "scaleway/scaleway"
      version = "<3.0.0"
    }
  }
  required_version = ">= 1.6"
}
