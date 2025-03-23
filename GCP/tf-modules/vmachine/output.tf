/* Output Variables for VM module */

output "external_ip" {
  description = "The external IP address of the VM instance"
  value       = google_compute_instance.vm.network_interface[0].access_config[0].nat_ip
}
