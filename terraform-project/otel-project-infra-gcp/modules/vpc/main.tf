resource "google_compute_network" "vpc" {
  name = var.vpc_name
  auto_create_subnetworks = false
  routing_mode = "GLOBAL"
  bgp_best_path_selection_mode = "STANDARD"
}

resource "google_compute_subnetwork" "pub_subnet" {
  name = var.pub_subnet_name
  network = google_compute_network.vpc.self_link
  ip_cidr_range = var.pub_cidr_range
}
