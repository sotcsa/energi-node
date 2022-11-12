variable "prefix" {
  description = "Prefix for iam user, group, policy and role, like prod-ci"
  type        = string
  default     = null
}

variable "use_suffix" {
  description = "Add suffix for entities, like for iam usr: {prefix}-user"
  type        = bool
  default     = true
}