############
# IAM User #
############
resource "aws_iam_user" "this" {
  name = "${var.prefix}-user"
  force_destroy = true
}

#############
# IAM Group #
#############
resource "aws_iam_group" "this" {
  name = "${var.prefix}-group"
}

data "aws_caller_identity" "this" {
  provider = aws
}

data "aws_iam_policy_document" "assume_role_in_same_account" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.this.account_id}:root"]
    }
  }
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect    = "Allow"
    actions   = ["sts:AssumeRole"]
    resources = [ aws_iam_role.this.arn ]
  }
}

resource "aws_iam_policy" "this" {
  name        = "${var.prefix}-policy"
  description = "Allows to assume role"
  policy      = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_group_policy_attachment" "this" {
  group      = aws_iam_group.this.id
  policy_arn = aws_iam_policy.this.id
}

resource "aws_iam_group_membership" "this" {
  group = aws_iam_group.this.id
  name  = "${var.prefix}-group"
  users = [ aws_iam_user.this.name ]
}


############
# IAM Role #
############
resource "aws_iam_role" "this" {
  name  = "${var.prefix}-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role_in_same_account.json
}

terraform {
  backend "local" {
    path = "state/terraform.tfstate"
  }
}
