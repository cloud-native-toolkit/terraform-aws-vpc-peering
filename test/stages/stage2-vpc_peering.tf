module "vpc_peering" {
  source  = "./module"
  region  = var.region
  vpc_id1 = module.edge_vpc.vpc_id
  vpc_id2 = module.mgmt_vpc.vpc_id
}
