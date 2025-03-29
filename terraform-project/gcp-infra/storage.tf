# Create GCS bucket for Terraform state
resource "google_storage_bucket" "terraform_state" {
  name          = "devopsdemo-453502-tfstate"
  location      = "US"
  force_destroy = false

  versioning {
    enabled = true
  }

  # Enable uniform bucket-level access
  uniform_bucket_level_access = true
  # Configure bucket lock
  retention_policy {
    retention_period = 1800  # 30 minutes
    is_locked       = true
  }
}