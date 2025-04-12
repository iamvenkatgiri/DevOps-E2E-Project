resource "google_compute_network" "vpc" {
  name = "${var.proj_name}-vpc"
  auto_create_subnetworks = false
  routing_mode = "GLOBAL"
  bgp_best_path_selection_mode = "STANDARD"
}

resource "google_compute_subnetwork" "pub_subnet" {
  name          = "${var.proj_name}-pub-subnet"
  network       = google_compute_network.vpc.self_link
  ip_cidr_range = var.pub_subnet_cidr
  region        = var.pub_sn_region
  description   = "Public Subnet"
  }

resource "google_compute_subnetwork" "pri_subnet" {
  name          = "${var.proj_name}-pri-subnet"
  ip_cidr_range = var.pri_subnet_cidr
  region        = var.pri_sn_region
  network       = google_compute_network.vpc.id
  private_ip_google_access = true  # So private VMs can reach Google APIs
  description   = "Private Subnet"
}

# Cloud Router for NAT
resource "google_compute_router" "router" {
  name    = "${var.proj_name}-router"
  network = google_compute_network.vpc.id
  region  = var.pri_sn_region
}

# NAT Gateway
resource "google_compute_router_nat" "nat" {
  name                              = "${var.proj_name}-nat"
  router                            = google_compute_router.router.name
  region                            = var.pri_sn_region
  nat_ip_allocate_option            = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  
  subnetwork {
    name                     = google_compute_subnetwork.pri_subnet.id
    source_ip_ranges_to_nat  = ["ALL_IP_RANGES"]
  }
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


resource "google_compute_firewall" "allow_ping" {
  name    = "allow-ping"
  network = google_compute_network.vpc.name

  allow {
    protocol = "icmp"
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["icmp-access"]  # VM must have this tag to allow traffic
  description   = "Allow ICMP from anywhere"
}