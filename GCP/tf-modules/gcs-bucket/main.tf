/* module for creating GCS bucket */

locals {
  public_access = var.block_public_access ? "enforced" : "inherited"
  cors = var.cors_enabled ? [{
    origin          = var.cors.origins
    method          = var.cors.methods
    response_header = var.cors.response_headers
    max_age_seconds = var.cors.max_age_seconds
  }] : []
}

resource "google_storage_bucket" "bucket" {
  name                        = var.bucket_name
  location                    = var.bucket_location
  storage_class               = var.default_storage_class
  force_destroy               = var.force_destroy
  uniform_bucket_level_access = var.uniform_bucket_level_access

  versioning {
    enabled = var.enable_versioning
  }

  dynamic "cors" {
    for_each = local.cors
    iterator = each
    content {
      origin          = each.value.origin
      method          = each.value.method
      response_header = each.value.response_header
      max_age_seconds = each.value.max_age_seconds
    }
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
