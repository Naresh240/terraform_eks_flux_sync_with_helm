################################################################################
# VPC
################################################################################

module "vpc" {
  source                      = "./vpc"
  project                     = var.project
  vpc_cidr                    = var.vpc_cidr
  subnet_count                = var.subnet_count
}
################################################################################
# EKS Cluster
################################################################################

module "eks-cluster" {
    source                      = "./eks_cluster"
    project                     = var.project
    vpc_id                      = module.vpc.vpc_id
    public_subnet_ids           = [module.vpc.public_subnet_ids]
    private_subnet_ids          = [module.vpc.private_subnet_ids]

    desired_size                = var.desired_size
    min_size                    = var.min_size
    max_size                    = var.max_size
    tags                        = var.tags

    depends_on  = [module.vpc]
}

################################################################################
# FluxCD
################################################################################

module "helm" {
  source        = "./helm"

  github_url        = var.github_url
  github_username   = var.github_username
  github_password   = base64decode(var.github_password)
  github_branch     = var.github_branch
  github_infra_path = var.github_infra_path

  depends_on = [module.eks-cluster]
}
