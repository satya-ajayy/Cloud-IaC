module "gke_cluster" {
  source       = "./tf-modules/gke-cluster"
  zone         = var.region
  cluster_name = "kube-cluster"
  disk_type    = "pd-standard"
  machine_type = "e2-medium"
  disk_size_gb = 30
  node_count = 2
}
