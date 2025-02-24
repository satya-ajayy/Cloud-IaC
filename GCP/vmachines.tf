// Machine Types
locals {
  standard_2C_8G    = "n2-standard-2"
  standard_4C_16G   = "n2-standard-4"
  standard_8C_32G   = "n2-standard-8"

  highmem_2C_16G   = "n2d-highmem-2-16"
  highmem_4C_32G   = "n2d-highmem-4-32"
  highmem_8C_64G   = "n2d-highmem-8-64"

  highcpu_64C_64G = "n2d-highcpu-64"
}

// VM to run docker images
# module "vmachine" {
#   source        = "./tf-modules/vmachines"
#   zone          = var.zone
#   instance_name = "deployments"
#   machine_type  = local.standard_2C_8G
#   disk_size_gb  = 20
#   exposed_ports = [22, 80, 443, 8000, 8501]
# }
