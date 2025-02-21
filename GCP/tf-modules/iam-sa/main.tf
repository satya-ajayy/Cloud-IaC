/* Module for creating service account */

data "google_project" "current" {}

resource "google_service_account" "sa" {
  account_id   = var.service_account_id
  display_name = var.display_name
  project      = data.google_project.current.project_id
}

resource "google_project_iam_member" "iam_roles" {
  for_each = toset(var.iam_roles)
  project = data.google_project.current.project_id
  role    = each.value
  member  = "serviceAccount:${google_service_account.sa.email}"
}
