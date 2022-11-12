provider "aws" {
  region = "eu-west-1"
}

################################
# IAM assumable role for group #
################################
module "assumable-iam-role" {
  source     = "git::https://github.com/sotcsa/energi-node.git//4-terraform/assumable-iam-role-module"
  prefix     = "prod-ci"
  use_suffix = false
}
