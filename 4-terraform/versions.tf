terraform {
  backend "local" {
    path = "state/terraform.tfstate"
  }

  required_version = ">= 1.0.0"
}