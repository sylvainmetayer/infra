variable "default_ttl" {
  type    = number
  default = 1800
}

variable "region" {
  type    = string
  default = "nbg1"
}

variable "server_type" {
  type    = string
  default = "cx21"
}

variable "server_image" {
  type    = string
  default = "debian-11"
}
