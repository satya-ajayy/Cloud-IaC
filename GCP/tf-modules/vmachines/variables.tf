/* Variables for the VM module */

variable "instance_name" {
  description = "The name of the VM instance"
  type        = string
}

variable "zone" {
  description = "The GCP zone where the VM will be deployed"
  type        = string
  default     = "us-central1-a"
}

variable "machine_type" {
  description = "The machine type for the VM instance"
  type        = string
  default     = "e2-medium"
}

variable "disk_size_gb" {
  description = "The size of the VM's boot disk in GB"
  type        = number
  default     = 10
}

variable "image" {
  description = "The OS image to use for the VM"
  type        = string
  default     = "debian-cloud/debian-12"
}

variable "network" {
  description = "The name of the network to attach the VM to"
  type        = string
  default     = "default"
}

variable "exposed_ports" {
  description = "A list of TCP ports to expose via firewall rules"
  type        = list(number)
  default     = [22, 80, 443]
}