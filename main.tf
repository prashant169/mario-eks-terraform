provider "aws" {
  region = var.aws_region
}
module "vpc" {
  source              = "./modules/vpc"
  vpc_cidr            = var.vpc_cidr
  vpc_name            = var.vpc_name
  igw_name            = var.igw_name
  public_subnet_cidr1 = var.public_subnet_cidr1
  public_subnet_cidr2 = var.public_subnet_cidr2
  subnet_name1        = var.subnet_name1
  subnet_name2        = var.subnet_name2
  az1                 = var.az1
  az2                 = var.az2
  rt_name             = var.rt_name
  sg_name             = var.sg_name
}

module "iam" {
  source   = "./modules/iam"
  name     = var.cluster_name
  iam_role = var.iam_role # <-- Add this line if needed
}

module "eks" {
  source           = "./modules/EKS"
  cluster_name     = var.cluster_name
  cluster_role_arn = module.iam.cluster_role_arn
  node_role_arn    = module.iam.node_role_arn
  subnet_ids       = module.vpc.public_subnet_ids
  vpc_id           = module.vpc.vpc_id
  desired_size     = var.desired_size
  max_size         = var.max_size
  min_size         = var.min_size
  instance_type    = var.instance_type
}

module "bastion" {
  source                = "./modules/bastion"
  bastion_ami_id        = var.bastion_ami_id
  bastion_instance_type = var.bastion_instance_type
  key_name              = var.key_name
  subnet_id             = module.vpc.public_subnet_ids[0]
  security_group_id     = module.vpc.security_group_id
}
