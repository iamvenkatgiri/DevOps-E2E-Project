
# Create VPC
resource "google_compute_network" "vpc_network" {
  name                    = "devops-demo-vpc"
  auto_create_subnetworks = false  # Set to true if you want automatic subnets
}

# Public Subnet in us-east1
resource "google_compute_subnetwork" "subnet_pub" {
  name          = "devops-demo-subnet-pub"
  region        = "us-east1"  # Keep this in the same region as the VPC
  network       = google_compute_network.vpc_network.id
  ip_cidr_range = "10.0.1.0/24"
}

# Public Subnet in us-east1
resource "google_compute_subnetwork" "subnet_pub2" {
  name          = "devops-demo-subnet-pub2"
  region        = "us-south1"  # Keep this in the same region as the VPC
  network       = google_compute_network.vpc_network.id
  ip_cidr_range = "10.0.3.0/24"
}

# Private Subnet (Should be in the same region as the VPC)
resource "google_compute_subnetwork" "subnet_pri" {
  name          = "devops-demo-subnet-pri"
  region        = "us-east1"  # Fixed: Keep in the same region
  network       = google_compute_network.vpc_network.id
  ip_cidr_range = "10.0.2.0/24"
}

# Firewall Rule to Allow SSH
resource "google_compute_firewall" "allow-ssh" {
  name    = "allow-ssh"
  network = google_compute_network.vpc_network.id

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]  # Allow SSH from anywhere (not recommended for production)
}

resource "google_compute_firewall" "allow-http" {
  name    = "allow-http"
  network = google_compute_network.vpc_network.id

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "allow-https" {
  name    = "allow-https"
  network = google_compute_network.vpc_network.id

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "allow-icmp" {
  name    = "allow-icmp"
  network = google_compute_network.vpc_network.id

  allow {
    protocol = "icmp"
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "allow-application-port" {
  name    = "allow-application-port"
  network = google_compute_network.vpc_network.id

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

  source_ranges = ["0.0.0.0/0"]
}