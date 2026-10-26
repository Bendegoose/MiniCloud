resource "aws_eks_cluster" "minicloud_eks_cluster" {
  name = var.eks_cluster_name

  access_config {
    authentication_mode = "API"
  }

  role_arn = aws_iam_role.minicloud_eks_cluster_role.arn
  version  = var.eks_cluster_version

  vpc_config {
    endpoint_private_access = true
    endpoint_public_access  = true
    public_access_cidrs     = var.public_access_cidrs

    subnet_ids = [
      aws_subnet.private_a.id,
      aws_subnet.private_b.id
    ]
  }
}