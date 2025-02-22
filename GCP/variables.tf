// 

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

variable "edatum_image" {
  description = "The Docker image to use for the Edatum dashboard"
  type        = string
}

variable "iris_image" {
  description = "The Docker image to use for the Iris Flowers predictor"
  type        = string
}

variable "news_webiste_image" {
  description = "The Docker image to use for the News Website"
  type        = string

}

variable "unsaved_phno_image" {
  description = "The Docker image to use for the Unsaved Phone Number service"
  type        = string
}

variable "mongo_uri" {
  description = "The MongoDB URI to connect to the database"
  type        = string
}

variable "api_key" {
  description = "The API key to use for the News Website"
  type        = string
}