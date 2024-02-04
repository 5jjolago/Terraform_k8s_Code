locals {
  cluster_name = "ozzorago-eks-${random_string.suffix.result}"
}
data "aws_eks_cluster" "cluster" {
  name = local.cluster_name
  depends_on = [module.eks.cluster_name]
}
data "aws_eks_cluster_auth" "cluster" {
  name = local.cluster_name
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.15.3"

  
  cluster_name    = local.cluster_name
  cluster_version = "1.28"

  vpc_id                         = aws_vpc.ozzorago_vpc.id
  subnet_ids = [
  aws_subnet.private-sn-1.id,
  aws_subnet.private-sn-2.id,
  aws_subnet.private-sn-3.id,
  aws_subnet.private-sn-4.id,
  aws_subnet.private-sn-5.id,
  aws_subnet.private-sn-6.id
  ]

  cluster_endpoint_public_access = true

  eks_managed_node_group_defaults = {
    ami_type = "AL2_x86_64"

  }

  eks_managed_node_groups = {
    one = {
      name = "node-group-1"

      instance_types = ["t3.small"]

      min_size     = 2
      max_size     = 5
      desired_size = 3
    }

    # two = {
    #   name = "node-group-2"

    #   instance_types = ["t3.small"]

    #   min_size     = 3
    #   max_size     = 5
    #   desired_size = 3
    # }
  }
}
# data "aws_eks_cluster_auth" "cluster" {
#   name = local.cluster_name
# }
# data "aws_eks_cluster" "cluster" {
#   name = module.eks.cluster_name
# }