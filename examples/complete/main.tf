variable "profile" {
  default = "default"
}
variable "region" {
  default = "cn-hangzhou"
}

provider "alicloud" {
  region  = var.region
  profile = var.profile
}

module "vpc_perring" {
  source  = "../.."
  region  = var.region
  profile = var.profile

  #cen
  cen_name        = "your_cen_name"
  cen_description = "terraform cen"

  #vpc
  vpc_name        = "your_vpc_name"
  vpc_cidr        = "192.168.0.0/16"
  vpc_tags = {
    Owner       = "user"
    Environment = "staging"
    Name        = "complete"
  }

  #cen attachment
  child_instance_region_id = var.region
}