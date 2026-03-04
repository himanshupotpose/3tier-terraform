provider "aws" {
  region = "ap-south-1"
}

module "vpc" {
  source  = "../../modules/vpc"
  project = var.project
  env     = var.env
}

module "S3" {
  source  = "../../S3/frontend"
  project = var.project
  env     = var.env
}

module "EKS" {
  source     = "../../EKS/backend"
  project    = var.project
  env        = var.env
  subnet_ids = concat(
    module.vpc.public_subnet_ids,
    module.vpc.private_subnet_ids
  )
}


module "RDS" {
  source  = "../../RDS-module/database"
  project = var.project
  env     = var.env
}