module "edge_vpc" {
  source               = "github.com/cloud-native-toolkit/terraform-aws-vpc"
  provision            = var.provision && var.cloud_provider == "aws" ? true : false
  name_prefix          = var.edge_name_prefix
  internal_cidr        = var.edge_internal_cidr
  instance_tenancy     = var.instance_tenancy
  resource_group_name  = var.resource_group_name
  enable_dns_hostnames = true
}

module "mgmt_vpc" {
  source               = "github.com/cloud-native-toolkit/terraform-aws-vpc"
  provision            = var.provision && var.cloud_provider == "aws" ? true : false
  name_prefix          = var.mgmt_name_prefix
  internal_cidr        = var.mgmt_internal_cidr
  instance_tenancy     = var.instance_tenancy
  resource_group_name  = var.resource_group_name
  enable_dns_hostnames = true
}
