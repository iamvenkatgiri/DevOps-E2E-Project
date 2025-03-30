variable "proj_name" {
  description = "The name of the VPC"
  type        = string
}

variable "pub_subnet_cidr" {
  description = "The CIDR range of the subnet"
  type        = string
}

variable "pub_sn_region" {
  description = "The region name"
  type        = string
}

variable "pri_subnet_cidr" {
  description = "The CIDR range of the private subnet"
  type        = string
}
variable "pri_sn_region" {
  description = "The region name"
  type        = string
}