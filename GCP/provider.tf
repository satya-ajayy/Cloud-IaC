// Terraform Configuration
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
    bucket = "pegasus-tf-states"
    prefix = "terraform/state"
  }
}

// Provider Configuration
provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}
