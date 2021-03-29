module "network" {
  source      = "./modules/network"
  environment = var.environment

  vpc_name             = var.vpc_name
  vpc_cidr             = var.vpc_cidr
  public_subnet_name   = var.public_subnet_name
  public_subnet_cidr   = var.public_subnet_cidr
  private_subnets_name = var.private_subnets_name
  private_subnets_cidr = var.private_subnets_cidr
  availability_zones   = var.availability_zones
}

module "instance" {
  source      = "./modules/instance"
  environment = var.environment

  vpc_id    = module.network.vpc_id
  subnet_id = module.network.private_subnet1

  instance_type = var.instance_type
  ami_id        = var.ami_id
  instance_name = var.instance_name
  key_name      = var.key_name
  db_user       = var.db_user
  db_password   = var.db_password
}

module "rds" {
  source      = "./modules/rds"
  environment = var.environment

  vpc_id                = module.network.vpc_id
  sg_ingress_cidr_block = var.vpc_cidr
  subnets_id            = [module.network.private_subnet1, module.network.private_subnet2]
}

module "s3_and_glacier" {
  source      = "./modules/s3_and_glacier"
  environment = var.environment

  glacier_name    = var.glacier_name
  s3_buckets_name = var.s3_buckets_name
}
