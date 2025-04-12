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
  value = module.otel-project-network.pub_subnet_cidr
}

output "pri_subnet_id" {
  value = module.otel-project-network.pri_subnet_id
}

output "pri_subnet_cidr" {
  value = module.otel-project-network.pri_subnet_cidr
}

output "instance_id" {
  description = "The ID of the instance"
  value       = module.public_vm.instance_id
}
output "internal_ip" {
  description = "The internal IP address of the instance"
  value       = module.public_vm.internal_ip
}
output "public_ip" {
  description = "The public IP address of the instance (null for private instances)"
  value       = module.public_vm.public_ip
}
output "instance_name" {
  description = "The name of the instance"
  value       = module.public_vm.instance_name
}
