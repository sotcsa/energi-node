module "consul" {
  source = "github.com/sotcsa/energi-node"
}


terraform {
  backend "local" {
    path = "state/terraform.tfstate"
  }
}
