# data "aws_iam_policy" "ebs_csi_policy" {
#   arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
# }

# module "irsa-ebs-csi" {
#   source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
#   version = "4.7.0"

#   create_role                   = true
#   role_name                     = "AmazonEKSTFEBSCSIRole-${module.eks.cluster_name}"
#   provider_url                  = module.eks.oidc_provider
#   role_policy_arns              = [data.aws_iam_policy.ebs_csi_policy.arn]
#   oidc_fully_qualified_subjects = ["system:serviceaccount:kube-system:ebs-csi-controller-sa"]
# }

# resource "aws_eks_addon" "ebs-csi" {
#   cluster_name             = module.eks.cluster_name
#   addon_name               = "aws-ebs-csi-driver"
#   addon_version            = "v1.20.0-eksbuild.1"
#   service_account_role_arn = module.irsa-ebs-csi.iam_role_arn
#   tags = {
#     "eks_addon" = "ebs-csi"
#     "terraform" = "true"
#   }
# }


# CSI DRIVER 설치 
# 변수값 변경해놨습니당
# resource "aws_iam_role_policy_attachment" "ebs-csi" {
#   role       = module.eks.eks_managed_node_groups["one"].iam_role_name
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
# }

# resource "aws_eks_addon" "ebs-csi" {
#   cluster_name  = local.cluster_name
#   addon_name    = "aws-ebs-csi-driver"
#   addon_version = "v1.26.1-eksbuild.1"
# }


# resource "aws_iam_role_policy_attachment" "ebs-csi" {
#   role       = module.eks.eks_managed_node_groups["one"].iam_role_name
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"

# }

resource "aws_iam_role_policy_attachment" "ebs-csi" {
  role       = module.eks.eks_managed_node_groups["one"].iam_role_name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
  depends_on = [
    module.eks
  ]
}


# resource "aws_eks_addon" "ebs-csi" {
#   cluster_name  = local.cluster_name
#   addon_name    = "aws-ebs-csi-driver"
#   addon_version = "v1.26.1-eksbuild.1"
#   #addon_version = "v1.10.1-eksbuild.6"
# }

resource "aws_eks_addon" "ebs-csi" {
  cluster_name = local.cluster_name
  depends_on = [
    module.eks
  ]
  addon_name    = "aws-ebs-csi-driver"
  addon_version = "v1.26.1-eksbuild.1" #kubernetes coredns의 버전마다 addon 버전이 다름
}

 

#grovince-eks-fFsTEuXw