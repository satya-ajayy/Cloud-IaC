// Scheduler Service
module "scheduler_service" {
  source           = "./tf-modules/cloud-run"
  service_name     = "scheduler"
  service_location = var.region
  image            = var.scheduler_image
  container_port   = 4202
  cpu              = "1000m"
  memory           = "4Gi"
  environment_variables = {
    "MONGO_URI"    = var.mongo_uri,
    "IS_PROD_MODE" = "true"
  }
  health_check_path = "/v1/health"
}

// Edatum Dashboard
module "edatum_dashboard" {
  source           = "./tf-modules/cloud-run"
  service_name     = "edatum"
  service_location = var.region
  image            = var.edatum_image
  container_port   = 4202
  cpu              = "2000m"
  memory           = "512mi"
  health_check_path = "/v1/health"
}

// Iris Flowers Prediction

// News Webiste

// UnSaved Phone Number
