module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.17.2"

#   enable_cluster_creator_admin_permissions = true

  cluster_name = "montapp-eks-cluster"
  cluster_version = "1.31"
  cluster_endpoint_public_access = true

  subnet_ids = module.montapp-vpc.private_subnets
  vpc_id = module.montapp-vpc.vpc_id

  tags = {
    environment = "development"
    application = "montapp"
  }
  eks_managed_node_groups = {
    dev = {
        min_size     = 1
        max_size     = 2
        desired_size = 1

        instance_types = ["t3.micro"]
    }
    }
}

# terraform {
#   required_providers {
#     aws = {
#       source = "hashicorp/aws"
#       version = ">= 6.0.0"
#     }
#     # linode = {
#     #   source = "linode/linode"
#     #   version = "2.41.0"
#     # }
#   }
# }