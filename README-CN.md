terraform-alicloud-vpc-peering
=====================================================================

本 Terraform 模块将用于在同一阿里云账号和地域的两个VPC之间建立对等连接。

本 Module 支持创建以下资源:

* [alicloud_cen_instance](https://www.terraform.io/docs/providers/alicloud/r/cen_instance.html)
* [alicloud_vpc](https://www.terraform.io/docs/providers/alicloud/r/vpc.html)
* [alicloud_cen_instance_attachment](https://www.terraform.io/docs/providers/alicloud/r/cen_instance_attachment.html)


## Terraform 版本

本模板要求使用版本 Terraform 0.12 和 阿里云 Provider 1.57.0+。

## 用法

在同一账号和可用区下创建云企业网实例和VPC实例并建立对等连接：

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

使用已经存在的云企业网实例和VPC实例建立连接：
**注意** 必须在同一账号和可用区的前提下。

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

## 示例

* [在创建vpc-peering 示例](https://github.com/terraform-alicloud-modules/terraform-alicloud-vpc-peering/tree/master/examples/complete)

## 注意事项

* 本 Module 使用的 AccessKey 和 SecretKey 可以直接从 `profile` 和 `shared_credentials_file` 中获取。如果未设置，可通过下载安装 [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) 后进行配置。

提交问题
------
如果在使用该 Terraform Module 的过程中有任何问题，可以直接创建一个 [Provider Issue](https://github.com/terraform-providers/terraform-provider-alicloud/issues/new)，我们将根据问题描述提供解决方案。

**注意:** 不建议在该 Module 仓库中直接提交 Issue。

作者
-------
Created and maintained by Yi Jincheng(yi785301535@163.com) and He Guimin(@xiaozhu36, heguimin36@163.com)

许可
----
Apache 2 Licensed. See LICENSE for full details.

参考
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)
