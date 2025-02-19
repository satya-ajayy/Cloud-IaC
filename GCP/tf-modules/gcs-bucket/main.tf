/* module for creating GCS bucket */

locals {
  public_access = var.block_public_access ? "enforced" : "inherited"
}

resource "google_storage_bucket" "bucket" {
  name                        = var.bucket_name
  location                    = var.bucket_location
  storage_class               = var.default_storage_class
  force_destroy               = var.force_destroy
  public_access_prevention    = local.public_access
  uniform_bucket_level_access = var.uniform_bucket_level_access

  versioning {
    enabled = var.enable_versioning
  }

  dynamic "lifecycle_rule" {
    for_each = var.lifecycle_rules
    iterator = rule
    content {
      condition {
        age            = rule.value.condition.age
        with_state     = rule.value.condition.with_state
        matches_suffix = rule.value.condition.matches_suffix
      }
      action {
        type          = rule.value.action.type
        storage_class = rule.value.action.storage_class
      }
    }

  }
}
