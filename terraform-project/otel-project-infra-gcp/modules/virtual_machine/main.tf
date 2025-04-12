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
    subnetwork = var.subnet
    # Only add access_config for public instances
    dynamic "access_config" {
      for_each = var.is_private_instance ? [] : [1]
      content {}
    }
  }

  metadata = {
    ssh-keys = "${var.ssh_username}:${file(var.public_ssh_key_path)}"
  }

  # Different tags based on instance type
  tags = var.is_private_instance ? ["private-instance","icmp-access","ssh-access"] : ["ssh-access", "web-access","icmp-access"]
}