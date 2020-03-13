#attachment
output "this_attachment_id" {
  description = "ID of the cen attachment resource."
  value       = module.vpc_perring.this_attachment_id
}

#cen
output "this_cen_id" {
  description = "The ID of the CEN instance."
  value       = module.vpc_perring.this_cen_id
}

output "this_cen_name" {
  description = "The name of the CEN instance."
  value       = module.vpc_perring.this_cen_name
}

output "this_cen_description" {
  description = "The description of the CEN instance."
  value       = module.vpc_perring.this_cen_description
}

#vpc
output "this_vpc_id" {
  description = "The ID of the VPC."
  value       = module.vpc_perring.this_vpc_id
}

output "this_vpc_cidr_block" {
  description = "The CIDR block for the VPC."
  value       = module.vpc_perring.this_vpc_cidr_block
}

output "this_vpc_name" {
  description = "The name of the VPC."
  value       = module.vpc_perring.this_vpc_name
}

output "this_vpc_description" {
  description = "The description of the VPC."
  value       = module.vpc_perring.this_vpc_description
}

output "this_vpc_router_id" {
  description = "The ID of the router created by default on VPC creation."
  value       = module.vpc_perring.this_vpc_router_id
}

output "this_vpc_route_table_id" {
  description = "The route table ID of the router created by default on VPC creation."
  value       = module.vpc_perring.this_vpc_route_table_id
}
