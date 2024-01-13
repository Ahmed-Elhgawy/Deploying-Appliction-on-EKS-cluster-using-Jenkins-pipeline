provider "aws" {
  region = var.region
}

module "network" {
  source = "./modules/network"

  cidr               = var.cidr
  availability-zones = var.availability-zones
}

module "security" {
  source = "./modules/security"

  cidr   = var.cidr
  vpc-id = module.network.vpc_id

  depends_on = [
    module.network
  ]
}

module "storage" {
  source = "./modules/storage"

  storage-sg-id      = [module.security.storage_sg_id]
  availability-zones = var.availability-zones
  subnet-id          = module.network.public_subnets_id[0]

  depends_on = [
    module.security
  ]
}

module "roles" {
  source = "./modules/roles"
}

module "cluster" {
  source = "./modules/cluster"

  ssh-key               = var.ssh-key
  remote-access-sg-id   = module.security.remote_access_sg_id
  public-subnets-id     = module.network.public_subnets_id
  cluster-name          = var.cluster-name
  eksClusterRole-arn    = module.roles.eksClusterRole_arn
  AmazonEKSNodeRole-arn = module.roles.AmazonEKSNodeRole_arn
  instance-types        = var.instance-type

  depends_on = [
    module.network,
    module.roles,
    module.security
  ]
}