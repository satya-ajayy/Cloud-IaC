/* Variables for cloud run service module */

variable "service_name" {
  description = "The name of the Cloud Run service"
  type        = string
}

variable "service_location" {
  description = "The location of the Cloud Run service"
  type        = string
  default     = "us-central1"
}

variable "image" {
  description = "The Docker image to use for the Cloud Run service"
  type        = string
}

variable "container_port" {
  description = "The port on which the container listens"
  type        = number
}

variable "environment_variables" {
  description = "A map of environment variables to set for the container"
  type        = map(string)
  default     = {}
}

variable "cpu" {
  description = "The amount of CPU to allocate to the Cloud Run service"
  type        = string
  default     = "1000m"
}

variable "memory" {
  description = "The amount of memory to allocate to the Cloud Run service"
  type        = string
  default     = "512Mi"
}

variable "req_timeout_seconds" {
  description = "The maximum duration for each request"
  type        = number
  default     = 300
}

variable "container_concurrency" {
  description = "The maximum number of concurrent requests each instance can handle"
  type        = number
  default     = 100
}

variable "min_instances" {
  description = "The minimum number of instances to keep running"
  type        = number
  default     = 1
}

variable "max_instances" {
  description = "The maximum number of instances to scale up to"
  type        = number
  default     = 1
}

variable "timeout_seconds" {
  description = "The maximum duration for the startup probe"
  type        = number
  default     = 120
}

variable "period_seconds" {
  description = "The interval between the probe checks"
  type        = number
  default     = 180
}

variable "failure_threshold" {
  description = "The number of consecutive failures needed to consider a probe failed"
  type        = number
  default     = 2
}

variable "health_check_path" {
  description = "The path to use for the liveness probe"
  type        = string
  default     = "/"
}

variable "enable_liveness_probe" {
  description = "Whether to enable the liveness probe"
  type        = bool
  default     = false
}

variable "service_account_email" {
  description = "The email of the service account to associate with the Cloud Run service"
  type        = string
}
