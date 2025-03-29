resource "google_compute_instance" "devops-demo-vm" {
  key_revocation_action_type = "NONE"
  machine_type               = "e2-standard-2"
  name                    = "opentelemetry-demo-vm"
  project                 = "devopsdemo-453502"
  tags                    = ["http-server", "https-server"]
  zone                    = "us-south1-c"
  advanced_machine_features {
    enable_nested_virtualization = false
    enable_uefi_networking       = false
    threads_per_core             = 2
    visible_core_count           = 1
  }
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2410-amd64"
      size  = 30  
      type  = "pd-balanced"
    }
  }
 
  network_interface {
    network = google_compute_network.vpc_network.id
    subnetwork = google_compute_subnetwork.subnet_pub2.id
    subnetwork_project          = "devopsdemo-453502"
    access_config {
    }
  }
  service_account {
    email  = "328850831288-compute@developer.gserviceaccount.com"
    scopes = [
      "https://www.googleapis.com/auth/devstorage.read_only", 
      "https://www.googleapis.com/auth/logging.write", 
      "https://www.googleapis.com/auth/monitoring.write", 
      "https://www.googleapis.com/auth/service.management.readonly", 
      "https://www.googleapis.com/auth/servicecontrol", 
      "https://www.googleapis.com/auth/trace.append"]
  }
}
