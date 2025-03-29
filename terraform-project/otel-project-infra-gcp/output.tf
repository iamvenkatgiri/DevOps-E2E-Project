output "project_name" {
  value = var.project_id
}

output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.otel-project-network.vpc_id
}

output "pub_subnet_id" {
  description = "The ID of the public subnet"
  value       = module.otel-project-network.pub_subnet_id
}

output "pub_subnet_cidr" {
  description = "The CIDR range of the public subnet"
  value       = module.otel-project-network.pub_subnet_cidr
}

output "public_vm_ip" {
  description = "The public IP of the VM instance"
  value       = module.public_vm.public_ip
}