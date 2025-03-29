terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.27.0"
    }
  }
}

provider "google" {
  project     = var.project_id
  region      = var.region_name
  credentials = file("/Users/venkatgirisasanapuri/.config/gcloud/application_default_credentials.json")
}

terraform {
  backend "gcs" {
    bucket      = "otel-proj-tfstate"
    prefix      = "terraform/state"
  }
}

module "otel-project-network" {
    source = "./modules/vpc"
    vpc_name = var.vpc_name
    pub_subnet_name = var.pub_subnet_name
    pub_cidr_range = var.pub_cidr_range
}
