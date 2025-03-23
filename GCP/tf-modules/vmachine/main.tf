/* Module to create virtual machine */

resource "google_compute_instance" "vm" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
      size  = var.disk_size_gb
    }
  }

  network_interface {
    network = var.network
    access_config {}
  }

  tags = ["gcp-vm"]
}

resource "google_compute_firewall" "allow_ports" {
  name    = "allow-vm-ports"
  network = var.network

  allow {
    protocol = "tcp"
    ports    = var.exposed_ports
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["gcp-vm"]
}
