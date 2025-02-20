variable "region" {
  description = "The region in which the resources will be created"
  type        = string
}

variable "zone" {
  description = "The zone in which the resources will be created"
  type        = string
}

variable "project_id" {
  description = "The project id in which the resources will be created"
  type        = string
}

variable "scheduler_image" {
  description = "The Docker image to use for the Scheduler service"
  type        = string
}

variable "mongo_uri" {
  description = "The MongoDB URI to connect to the database"
  type        = string
}
