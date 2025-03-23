/* Output Variables for gke-cluster module */

output "cluster_name" {
  description = "The name of the cluster"
  value       = google_container_cluster.cluster.name
}

output "cluster_endpoint" {
  description = "The endpoint of the cluster"
  value       = google_container_cluster.cluster.endpoint
}

output "cluster_ca_certificate" {
  description = "The CA certificate of the cluster"
  value       = google_container_cluster.cluster.master_auth[0].cluster_ca_certificate
  sensitive   = true
}