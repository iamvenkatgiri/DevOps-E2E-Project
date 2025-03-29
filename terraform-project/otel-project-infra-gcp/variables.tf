variable "project_id" {
  description = "The project ID"
  type        = string
  }

variable "region_name" {
  description = "The region name"
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "pub_subnet_name" {}

variable "pub_cidr_range" {}