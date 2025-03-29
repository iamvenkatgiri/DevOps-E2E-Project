output "vpc_id" {
  description = "The ID of the VPC"
  value       = google_compute_network.vpc.id
}

output "pub_subnet_id" {
  description = "The ID of the public subnet"
  value       = google_compute_subnetwork.pub_subnet.id
}

output "pub_subnet_cidr"{
    description = "The CIDR range of the public subnet"
    value       = google_compute_subnetwork.pub_subnet.ip_cidr_range
}

output "public_subnet_self_link" {
  value = google_compute_subnetwork.pub_subnet.self_link
}

