/* Module for creating cloud run service */

resource "google_cloud_run_service" "cloud_run_service" {
  name     = var.service_name
  location = var.service_location
  metadata {
    annotations = {
      "run.googleapis.com/minScale" = tostring(var.min_instances)
    }
  }

  template {
    metadata {
      annotations = {
        "autoscaling.knative.dev/minScale"     = tostring(var.min_instances)
        "autoscaling.knative.dev/maxScale"     = tostring(var.max_instances)
        "run.googleapis.com/startup-cpu-boost" = true
        "run.googleapis.com/cpu-throttling"    = false
      }
    }

    spec {
      containers {
        image = var.image

        ports {
          container_port = var.container_port
        }

        resources {
          limits = {
            cpu    = var.cpu
            memory = var.memory
          }
        }

        dynamic "env" {
          for_each = var.environment_variables
          content {
            name  = env.key
            value = env.value
          }
        }

        startup_probe {
          tcp_socket {
            port = var.container_port
          }
          timeout_seconds   = var.timeout_seconds
          period_seconds    = var.period_seconds
          failure_threshold = var.failure_threshold
        }

        dynamic "liveness_probe" {
          for_each = var.enable_liveness_probe ? [1] : []
          content {
            http_get {
              path = var.health_check_path
              port = var.container_port
            }
            period_seconds    = var.period_seconds
            timeout_seconds   = var.timeout_seconds
            failure_threshold = var.failure_threshold
          }
        }
      }

      timeout_seconds       = var.req_timeout_seconds
      container_concurrency = var.container_concurrency
      service_account_name  = var.service_account_email
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}

# Grant public access to the service
resource "google_cloud_run_service_iam_member" "public_access" {
  service  = google_cloud_run_service.cloud_run_service.name
  location = google_cloud_run_service.cloud_run_service.location
  role     = "roles/run.invoker"
  member   = "allUsers"
}
