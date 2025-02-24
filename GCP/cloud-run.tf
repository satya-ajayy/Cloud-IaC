// Scheduler Service
# module "scheduler_service" {
#   source           = "./tf-modules/cloud-run"
#   service_name     = "scheduler"
#   service_location = var.region
#   image            = var.scheduler_image
#   container_port   = 4202
#   cpu              = "2000m"
#   memory           = "4Gi"
#   environment_variables = {
#     "MONGO_URI"    = var.mongo_uri,
#     "IS_PROD_MODE" = "true"
#   }
#   enable_liveness_probe = true
#   health_check_path     = "/scheduler/v1/health"
# }

// Edatum Dashboard
# module "edatum_dashboard" {
#   source           = "./tf-modules/cloud-run"
#   service_name     = "edatum"
#   service_location = var.region
#   image            = var.edatum_image
#   container_port   = 8501
#   cpu              = "2000m"
#   memory           = "512Mi"
#   max_instances    = 2
# }

// Iris Flowers Prediction
# module "iris_flowers_predictor" {
#   source           = "./tf-modules/cloud-run"
#   service_name     = "iris-flowers"
#   service_location = var.region
#   image            = var.iris_image
#   container_port   = 8501
# }

// News Webiste
# module "news_website" {
#   source           = "./tf-modules/cloud-run"
#   service_name     = "news-website"
#   service_location = var.region
#   image            = var.news_webiste_image
#   container_port   = 8000
#   cpu              = "2000m"
#   environment_variables = {
#     "API_KEY" = var.api_key
#   }
# }

// UnSaved Phone Number
# module "unsaved_phno" {
#   source                = "./tf-modules/cloud-run"
#   service_name          = "unsaved-phno"
#   service_location      = var.region
#   image                 = var.unsaved_phno_image
#   container_port        = 8000
#   service_account_email = module.cloud-run-sa.service_account_email
# }
