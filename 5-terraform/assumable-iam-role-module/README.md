# AWS IAM Terraform module: assumable role for group

## Usage

`assumable-iam-role`:

```hcl
module "assumable-iam-role" {
  source = "git::https://github.com/sotcsa/energi-node.git//5-terraform/assumable-iam-role-module"  
  prefix = "prod-ci"
}

```