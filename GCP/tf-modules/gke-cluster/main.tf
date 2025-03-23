/* Module for creating GKE Cluster */

resource "google_container_cluster" "cluster" {
  name     = var.cluster_name
  location = var.zone

  initial_node_count = var.node_count
  deletion_protection = var.deletion_protection

  node_config {
    machine_type = var.machine_type
    disk_type    = var.disk_type
    disk_size_gb = var.disk_size_gb

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }

  logging_service    = "logging.googleapis.com/kubernetes"
  monitoring_service = "none"

  addons_config {
    http_load_balancing {
      disabled = false
    }
    horizontal_pod_autoscaling {
      disabled = true
    }
    network_policy_config {
      disabled = true
    }
  }
}
