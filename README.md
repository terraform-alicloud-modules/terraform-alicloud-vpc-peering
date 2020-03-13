Terraform module to create a peering connection between two VPCs in the same Alibaba Cloud account and region.  
terraform-alicloud-vpc-peering
--------------------------

English | [简体中文](https://github.com/terraform-alicloud-modules/terraform-alicloud-vpc-peering/blob/master/README-CN.md)

Terraform module which create a peering connection between two VPCs in the same Alibaba Cloud account and region.  

These types of resources are supported:

* [alicloud_cen_instance](https://www.terraform.io/docs/providers/alicloud/r/cen_instance.html)
* [alicloud_vpc](https://www.terraform.io/docs/providers/alicloud/r/vpc.html)
* [alicloud_cen_instance_attachment](https://www.terraform.io/docs/providers/alicloud/r/cen_instance_attachment.html)

## Terraform versions

This module requires Terraform 0.12 and Terraform Provider AliCloud 1.57.0+.

## Usage


Create a peering connection between two VPCs in the same Alibaba Cloud account and region：

```hcl
module "vpc_peering"  {
  source   = "terraform-alicloud-modules/vpc-peering/alicloud"
  region   = "cn-hangzhou"                
  profile  = "Your-Profile-Name"
  
  #cen
  using_existing_cen_id = true
  existing_cen_id       = "cen-4parfxx91j5sxxxxxx"

  #vpc
  using_existing_vpc_id = true
  existing_vpc_id       = "vpc-bp1kizrg24e9nxxxxx"
  
  #cen attachment
  child_instance_region_id = "cn-hangzhou"
}
```

Using existing vpc and cen:
**Note** Must be under the same account and Availability Zone

```hcl
module "vpc_peering"  {
  source   = "terraform-alicloud-modules/vpc-peering/alicloud"
  region   = "cn-hangzhou"                
  profile  = "Your-Profile-Name"
  
  #cen
  cen_name        = "your_cen_name"
  cen_description = "terraform cen"

  #vpc
  vpc_name        = "your_vpc_name"
  vpc_cidr        = "192.168.0.0/16"
  vpc_description = "A VPC created by Terrafrom module terraform-alicloud-vpc"
  vpc_tags = {
    Owner       = "user"
    Environment = "staging"
    Name        = "complete"
  }
  
  #cen attachment
  child_instance_region_id = "cn-hangzhou"
}
```

## Examples

* [complete](https://github.com/terraform-alicloud-modules/terraform-alicloud-vpc-peering/tree/master/examples/complete)

## Notes

* This module using AccessKey and SecretKey are from `profile` and `shared_credentials_file`.
If you have not set them yet, please install [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) and configure it.

Submit Issues
-------------
If you have any problems when using this module, please opening a [provider issue](https://github.com/terraform-providers/terraform-provider-alicloud/issues/new) and let us know.

**Note:** There does not recommend to open an issue on this repo.

Authors
-------
Created and maintained by He Guimin(@xiaozhu36, heguimin36@163.com) and Yi Jincheng(yi785301535@163.com) 

License
----
Apache 2 Licensed. See LICENSE for full details.

Reference
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)
