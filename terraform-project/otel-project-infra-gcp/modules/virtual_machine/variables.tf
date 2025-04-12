variable "instance_name" {}
variable "machine_type" {}
variable "zone" {}
variable "image" {}
variable "subnet" {}
variable "public_ssh_key_path" {}
variable "ssh_username" {}
variable "is_private_instance" {
  description = "Whether the instance should be private (no public IP)"
  type        = bool
  default     = false
}