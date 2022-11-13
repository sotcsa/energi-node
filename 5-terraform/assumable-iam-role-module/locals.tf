locals {
  iam_user_name   = var.use_suffix ? "${var.prefix}-user" : "${var.prefix}"
  iam_role_name   = var.use_suffix ? "${var.prefix}-role" : "${var.prefix}"
  iam_group_name  = var.use_suffix ? "${var.prefix}-group" : "${var.prefix}"
  iam_policy_name = var.use_suffix ? "${var.prefix}-policy" : "${var.prefix}"
}