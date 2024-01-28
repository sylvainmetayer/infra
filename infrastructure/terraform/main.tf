terraform {
  backend "s3" {
    key      = "terraform.tfstate"
    region = "germany"
    bucket = "tofu-state"
    endpoint = "https://s3.tebi.io"
    skip_region_validation = true
    skip_metadata_api_check = true
    skip_credentials_validation = true
  }
}
