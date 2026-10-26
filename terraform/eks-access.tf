resource "aws_eks_access_entry" "eks_entry" {
  cluster_name  = aws_eks_cluster.minicloud_eks_cluster.name
  principal_arn = var.eks_admin_principal_arn //tfvarsba
  type          = "STANDARD"
}

resource "aws_eks_access_policy_association" "example" {
  cluster_name  = aws_eks_cluster.minicloud_eks_cluster.name
  policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
  principal_arn = aws_eks_access_entry.eks_entry.principal_arn

  access_scope {
    type = "cluster"
  }
}
