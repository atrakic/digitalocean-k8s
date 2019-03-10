terraform {
  required_version = ">= 0.11.10"
}

provider "digitalocean" {
  version = ">= 1.1.0"
  token  = "${var.token}"
}

provider "null" {
  version = ">= 2.1.0"
}

/*
provider "random" {
  version = ">= 2.0.0"
}

provider "external" {
  version = "1.0.0"
}

provider "local" {
  version = "1.0.0"
}

provider "template" {
  version = "1.0.0"
}
*/
