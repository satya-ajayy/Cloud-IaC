/* Variables for iam-sa module */

variable "service_account_id" {
  description = "The ID of the service account"
  type        = string
}

variable "display_name" {
  description = "The display name of the service account"
  type        = string
}

variable "iam_roles" {
  description = "List of IAM roles to assign to the service account"
  type        = list(string)
}
