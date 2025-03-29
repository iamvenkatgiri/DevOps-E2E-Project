variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "pub_subnet_name" {
  description = "The name of the subnet"
  type        = string
}

variable "pub_cidr_range" {
  description = "The CIDR range of the subnet"
  type        = string
}