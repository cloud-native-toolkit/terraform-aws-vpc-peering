variable "edge_name_prefix" {
  type        = string
  description = "Prefix name that should be used for peering gateway"
  default     = "swe-edge"
}

variable "mgmt_name_prefix" {
  type        = string
  description = "Prefix name that should be used for peering gateway"
  default     = "swe-mgmt"
}


variable "edge_internal_cidr" {
  type        = string
  description = "The cidr range of the internal network.Either provide manually or chose from AWS IPAM poolsß"
  default     = "10.0.0.0/16"
}

variable "mgmt_internal_cidr" {
  type        = string
  description = "The cidr range of the internal network.Either provide manually or chose from AWS IPAM poolsß"
  default     = "10.1.0.0/16"
}

variable "instance_tenancy" {
  type        = string
  description = "Instance is shared / dedicated, etc. #[default, dedicated, host]"
  default     = "default"
}

variable "resource_group_name" {
  type        = string
  description = "Existing resource group where the IKS cluster will be provisioned."
  default     = "default"
}

variable "vpc_id1" {
  type    = string
  default = ""
}

variable "vpc_id2" {
  type    = string
  default = ""
}

variable "cloud_provider" {
  type    = string
  default = "aws"

}

variable "provision" {
  type        = bool
  description = "Flag indicating that the instance should be provisioned. If false then an existing instance will be looked up"
  default     = true
}



variable "region" {
  type        = string
  default     = "ap-southeast-2"
  description = "Please set the region where the resouces to be created "
}

variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}


