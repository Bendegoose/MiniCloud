output "aws_region" {
  description = "AWS region"
  value       = var.aws_region
}

output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.minicloud.id
}

output "eks_cluster_name" {
  description = "EKS Cluster name"
  value       = var.eks_cluster_name
}

output "eks_cluster_endpoint" {
  description = "EKS Kubernetes API endpoint"
  value       = aws_eks_cluster.minicloud_eks_cluster.endpoint
}

output "eks_worker_node_group_name" {
  description = "Name of the node group"
  value       = aws_eks_node_group.worker_node_group.node_group_name
}

output "ecr_backend_repository_url" {
  description = "Backend ECR repository URL"
  value       = aws_ecr_repository.backend.repository_url
}

output "ecr_frontend_repository_url" {
  description = "Frontend ECR repository URL"
  value       = aws_ecr_repository.frontend.repository_url
}

output "github_actions_ecr_role_arn" {
  description = "IAM Role ARN for GitHub Actions ECR publishing"
  value       = aws_iam_role.github_actions_ecr.arn
}