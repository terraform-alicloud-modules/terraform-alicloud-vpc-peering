#attachment
output "this_attachment_id" {
  description = "ID of the cen attachment resource."
  value       = concat(alicloud_cen_instance_attachment.attachment.*.id, [""])[0]
}

#cen
output "this_cen_id" {
  description = "The ID of the CEN instance."
  value       = concat(alicloud_cen_instance.cen.*.id, [""])[0]
}

output "this_cen_name" {
  description = "The name of the CEN instance."
  value       = concat(alicloud_cen_instance.cen.*.name, [""])[0]
}

output "this_cen_description" {
  description = "The description of the CEN instance."
  value       = alicloud_cen_instance.cen.*.description
}

#vpc
output "this_vpc_id" {
  description = "The ID of the VPC."
  value       = concat(alicloud_vpc.vpc.*.id, [""])[0]
}

output "this_vpc_cidr_block" {
  description = "The CIDR block for the VPC."
  value       = concat(alicloud_vpc.vpc.*.cidr_block, [""])[0]
}

output "this_vpc_name" {
  description = "The name of the VPC."
  value       = concat(alicloud_vpc.vpc.*.name, [""])[0]
}

output "this_vpc_description" {
  description = "The description of the VPC."
  value       = alicloud_vpc.vpc.*.description
}

output "this_vpc_router_id" {
  description = "The ID of the router created by default on VPC creation."
  value       = concat(alicloud_vpc.vpc.*.router_id, [""])[0]
}

output "this_vpc_route_table_id" {
  description = "The route table ID of the router created by default on VPC creation."
  value       = concat(alicloud_vpc.vpc.*.route_table_id, [""])[0]
}
