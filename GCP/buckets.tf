module "pdfs_bucket" {
  source                      = "./tf-modules/gcs-bucket"
  bucket_name                 = "transcripts-pdfs"
  bucket_location             = var.region
  enable_versioning           = false
  uniform_bucket_level_access = true
  block_public_access         = true
  lifecycle_rules = [{
    action = {
      type = "Delete"
    }
    condition = {
      age            = 100
      with_state     = "ANY"
      matches_suffix = [".pdf"]
    }
  }]
}
