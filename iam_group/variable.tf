variable "account_id" {
  type        = string
  description = "aws account id"
  default     = "766170891508"
}


variable "group_name" {
  type        = string
  description = "group name"
  default     = "prod-ci-group"
}


variable "policy_name" {
  type        = string
  description = "policy name"
  default     = "prod-ci-policy"
}

# variable "user_name" {
#   type        = string
#   description = "prod user name"
#   default     = "prod-ci-user"
# }

variable "group_member" {
  type        = string
  description = "prod members"
  default     = "prod_ci_members"
}
