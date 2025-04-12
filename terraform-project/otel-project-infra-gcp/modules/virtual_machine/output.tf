output "instance_id" {
  description = "The ID of the instance"
  value       = google_compute_instance.vm_instance.id
}

output "internal_ip" {
  description = "The internal IP address of the instance"
  value       = google_compute_instance.vm_instance.network_interface[0].network_ip
}

output "public_ip" {
  description = "The public IP address of the instance (null for private instances)"
  value       = var.is_private_instance ? null : google_compute_instance.vm_instance.network_interface[0].access_config[0].nat_ip
}

output "instance_name" {
  description = "The name of the instance"
  value       = google_compute_instance.vm_instance.name
}