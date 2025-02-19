/* Varaibles for GCS bucket module */

variable "bucket_name" {
  description = "The name of the bucket"
  type        = string
}

variable "force_destroy" {
  description = "If set to true, the bucket will be destroyed along with all its contents"
  type        = bool
  default     = false
}

variable "bucket_location" {
  description = "The location of the bucket"
  type        = string
  default     = "asia-south1"
}

variable "default_storage_class" {
  description = "The default storage class of the bucket"
  type        = string
  default     = "STANDARD"
}

variable "block_public_access" {
  description = "If set to true, the bucket will block all public access"
  type        = bool
  default     = false
}

variable "uniform_bucket_level_access" {
  description = "If set to true, the bucket will have uniform bucket level access enabled"
  type        = bool
  default     = false
}

variable "enable_versioning" {
  description = "If set to true, the bucket will have versioning enabled"
  type        = bool
  default     = false
}

variable "lifecycle_rules" {
  description = "The lifecycle rules for the bucket"
  type = list(object({
    action = object({
      type          = string
      storage_class = optional(string, null)
    })
    condition = object({
      age            = string
      with_state     = optional(string, "ANY")
      matches_suffix = optional(list(string), null)
    })
  }))
  default = []
}
