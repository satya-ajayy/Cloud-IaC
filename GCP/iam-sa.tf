// Service Accounts
module "cloud-run-sa" {
  source             = "./tf-modules/iam-sa"
  service_account_id = "cloud-run-sa"
  display_name       = "Cloud Run Service Account"
  iam_roles = [
    "roles/run.admin",
    "roles/storage.objectViewer"
  ]
}
