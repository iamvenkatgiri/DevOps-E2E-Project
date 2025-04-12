variable "project_id" {
  description = "The project ID"
  type        = string
}

variable "region_name" {
  description = "The region name"
  type        = string
}

variable "proj_name" {
  description = "The name of the VPC"
  type        = string
}

variable "pub_subnet_cidr" {}
variable "pub_sn_region" {}

variable "pri_subnet_cidr" {}
variable "pri_sn_region" {}

variable "instance_name" {}
variable "machine_type" {}
variable "public_instance_zone" {}
variable "private_instance_zone" {}
variable "image" {}
variable "public_ssh_key_path" {}
variable "ssh_username" {}
