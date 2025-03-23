/* Variables for gke-cluster module */

variable "cluster_name" {
  description = "The name of the GKE cluster"
  type        = string
}

variable "zone" {
  description = "The GCP zone for the cluster"
  type        = string
  default     = "us-central1-a"
}

variable "disk_size_gb" {
  description = "Boot disk size for the nodes in GB"
  type        = number
  default     = 50
}

variable "disk_type" {
  description = "Disk type for the nodes"
  type        = string
  default     = "pd-ssd"
}

variable "node_count" {
  description = "Number of nodes in the default node pool"
  type        = number
  default     = 3
}

variable "machine_type" {
  description = "Machine type for the nodes"
  type        = string
  default     = "e2-standard-2"
}

variable "deletion_protection" {
  description = "Whether or not to allow Terraform to destroy the cluster"
  type        = bool
  default     = false
}