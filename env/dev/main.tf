provider "aws" {
  region = "ap-south-1"
}

module "vpc" {
  source  = "../../modules/vpc"
  project = var.project
  env     = var.env
}

module "s3" {
  source  = "../../modules/s3"
  project = var.project
  env     = var.env
}

module "ec2" {
  source = "../../modules/ec2"
  project = var.project
  env = var.env
  public_subnet_id = module.vpc.public_subnet_id
}

module "rds" {
  source  = "../../modules/rds"
  project = var.project
  env     = var.env
}