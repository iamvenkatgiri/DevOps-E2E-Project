output "vpc_id" {
  description = "The ID of the VPC"
  value       = google_compute_network.vpc.id
}

output "pub_subnet_id" {
  description = "The ID of the public subnet"
  value       = google_compute_subnetwork.pub_subnet.id
}

output "pub_subnet_self_link" {
  value = google_compute_subnetwork.pub_subnet.self_link
}

output "pub_subnet_cidr" {
  value = google_compute_subnetwork.pub_subnet.ip_cidr_range
}

output "pri_subnet_id" {
  value = google_compute_subnetwork.pri_subnet.id
}

output "pri_subnet_self_link" {
  value = google_compute_subnetwork.pri_subnet.self_link
}

output "pri_subnet_cidr" {
  value = google_compute_subnetwork.pri_subnet.ip_cidr_range
}
