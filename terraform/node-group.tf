resource "aws_eks_node_group" "worker_node_group" {
  cluster_name    = aws_eks_cluster.minicloud_eks_cluster.name
  node_group_name = "worker-node-group"
  node_role_arn   = aws_iam_role.minicloud_eks_worker_node_role.arn
  subnet_ids = [
    aws_subnet.private_a.id,
    aws_subnet.private_b.id
  ]

  instance_types = var.eks_node_instance_type

  scaling_config {
    desired_size = var.eks_node_desired_size
    max_size     = var.eks_node_max_size
    min_size     = var.eks_node_min_size
  }

  update_config {
    max_unavailable = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.worker_node_policy,
    aws_iam_role_policy_attachment.worker_node_cni_policy,
    aws_iam_role_policy_attachment.worker_node_ecr_policy,
  ]
}
