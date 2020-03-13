provider "alicloud" {
  profile                 = var.profile != "" ? var.profile : null
  shared_credentials_file = var.shared_credentials_file != "" ? var.shared_credentials_file : null
  region                  = var.region != "" ? var.region : null
  skip_region_validation  = var.skip_region_validation
  configuration_source    = "terraform-alicloud-modules/vpc-peering"
}

locals {
  vpc_id = var.using_existing_vpc_id != false || var.existing_vpc_id != "" ? var.existing_vpc_id : concat(alicloud_vpc.vpc.*.id, [""])[0]
  cen_id = var.using_existing_cen_id != false || var.existing_cen_id != "" ? var.existing_cen_id : concat(alicloud_cen_instance.cen.*.id, [""])[0]

}
resource "alicloud_cen_instance" "cen" {
  count       = var.using_existing_cen_id != false || var.existing_cen_id != "" ? 0 : var.create_cen ? 1 : 0
  name        = var.cen_name
  description = var.cen_description
}

resource "alicloud_vpc" "vpc" {
  count       = var.using_existing_vpc_id || var.existing_vpc_id != "" ? 0 : var.create_vpc ? 1 : 0
  name        = var.vpc_name
  cidr_block  = var.vpc_cidr
  description = var.vpc_description
  tags = merge(
    {
      "Name" = format("%s", var.vpc_name)
    },
    var.vpc_tags,
  )
}

resource "alicloud_cen_instance_attachment" "attachment" {
  count                    = var.create_attachment ? 1 : 0
  instance_id              = local.cen_id
  child_instance_id        = local.vpc_id
  child_instance_region_id = var.child_instance_region_id
  child_instance_owner_id  = var.child_instance_owner_id
}
