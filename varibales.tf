variable "region" {
  description = "The region used to launch this module resources."
  type        = string
  default     = ""
}

variable "profile" {
  description = "The profile name as set in the shared credentials file. If not set, it will be sourced from the ALICLOUD_PROFILE environment variable."
  type        = string
  default     = ""
}
variable "shared_credentials_file" {
  description = "This is the path to the shared credentials file. If this is not set and a profile is specified, $HOME/.aliyun/config.json will be used."
  type        = string
  default     = ""
}

variable "skip_region_validation" {
  description = "Skip staticvalidation of region ID. Used by users of alternative AlibabaCloud-like APIs or users w/ access to regions that are not public (yet)."
  type        = bool
  default     = false
}

# VPC variables
variable "create_vpc" {
  description = "Whether to create vpc. If false, you can specify an existing vpc by setting 'vpc_id'."
  type        = bool
  default     = true
}

variable "using_existing_vpc_id" {
  description = "Whether to create instance. If false, you can specify an existing vpc instance."
  type        = bool
  default     = false
}

variable "existing_vpc_id" {
  description = "The vpc id used to launch several vswitches. If set, the 'create_vpc' will be ignored."
  type        = string
  default     = ""
}

variable "vpc_name" {
  description = "The vpc name used to launch a new vpc."
  type        = string
  default     = ""
}

variable "vpc_description" {
  description = "The vpc description used to launch a new vpc."
  type        = string
  default     = "A new VPC created by Terrafrom module terraform-alicloud-vpc"
}

variable "vpc_cidr" {
  description = "The cidr block used to launch a new vpc."
  type        = string
  default     = ""
}

variable "vpc_tags" {
  description = "The tags used to launch a new vpc. Before 1.5.0, it used to retrieve existing VPC."
  type        = map(string)
  default     = {}
}

#cen
variable "create_cen" {
  description = "Whether to create cen. If false, you can specify an existing cen by setting 'cen_id'."
  type        = bool
  default     = true
}

variable "using_existing_cen_id" {
  description = "Whether to create instance. If false, you can specify an existing cen instance."
  type        = bool
  default     = false
}

variable "existing_cen_id" {
  description = "The cen id used to launch several vswitches. If set, the 'create_cen' will be ignored."
  type        = string
  default     = ""
}

variable "cen_name" {
  description = "The name of the CEN instance. Defaults to null. The name must be 2 to 128 characters in length and can contain letters, numbers, periods (.), underscores (_), and hyphens (-). The name must start with a letter, but cannot start with http:// or https://."
  type        = string
  default     = ""
}

variable "cen_description" {
  description = " The description of the CEN instance. Defaults to null. The description must be 2 to 256 characters in length. It must start with a letter, and cannot start with http:// or https://."
  type        = string
  default     = ""
}

#cen attachment
variable "create_attachment" {
  description = "Whether to create attachement for vpc and cen."
  type        = bool
  default     = true
}

variable "child_instance_region_id" {
  description = " The region ID of the child instance to attach."
  type        = string
  default     = ""
}

variable "child_instance_owner_id" {
  description = "The uid of the child instance. Only used when attach a child instance of other account."
  type        = string
  default     = ""
}