terraform {
  required_version = ">= 1.7.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.2.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.23.0"
    }
  }
  backend "gcs" {
    bucket = "terraform-state-bucket-515"
    prefix = "terraform/state"
  }
}

provider "google" {
  project     = var.project_id
  region      = var.region
  zone        = var.zone
}
