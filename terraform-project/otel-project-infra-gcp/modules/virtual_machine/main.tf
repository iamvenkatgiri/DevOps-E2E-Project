resource "google_compute_instance" "vm_instance" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    subnetwork         = var.subnet
    access_config {}  # This block gives the instance a public IP
  }

  metadata = {
    ssh-keys = "${var.ssh_username}:${file(var.public_ssh_key_path)}"
  }

  tags = ["ssh-access", "web-access"]

}
