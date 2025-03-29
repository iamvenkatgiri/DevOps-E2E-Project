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

resource "google_compute_firewall" "allow_ssh_ingress" {
  name    = "allow-ssh"
  network = google_compute_network.vpc.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]  # Allow SSH from anywhere (you can restrict this later)
  target_tags   = ["ssh-access"]  # VM must have this tag to allow traffic
  description   = "Allow SSH from internet"
}
resource "google_compute_firewall" "allow_http_https" {
  name    = "allow-http-https"
  network = google_compute_network.vpc.name

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["web-access"]
  description   = "Allow HTTP and HTTPS from internet"
}
