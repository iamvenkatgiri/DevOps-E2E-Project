provider "google" {
  project     = "devopsdemo-453502"
  region      = "us-east1"
  credentials = file("/Users/venkatgirisasanapuri/Desktop/Projects/DevOpsE2EProject/devopsdemo-453502-50db3ac86cfe.json")
}

terraform {
  backend "gcs" {
    bucket      = "devopsdemo-453502-tfstate"
    prefix      = "terraform/state"
    credentials = "/Users/venkatgirisasanapuri/Desktop/Projects/DevOpsE2EProject/devopsdemo-453502-50db3ac86cfe.json"
     # Enable state locking
    enable_bucket_policy_only = true
    
    # Lock object configuration
    lock_table = "terraform_locks"
  }
}
