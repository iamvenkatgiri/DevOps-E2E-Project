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
    proj_name = var.proj_name
    pub_subnet_cidr = var.pub_subnet_cidr
    pub_sn_region = var.pub_sn_region

    pri_subnet_cidr = var.pri_subnet_cidr
    pri_sn_region = var.pri_sn_region
}

# module "public_vm" {
#   source               = "./modules/virtual_machine"
#   instance_name        = var.instance_name
#   machine_type         = var.machine_type
#   zone                 = var.zone
#   image                = var.image
#   subnet               = module.otel-project-network.public_subnet_self_link
#   ssh_username             = var.ssh_username
#   public_ssh_key_path  = var.public_ssh_key_path
# }