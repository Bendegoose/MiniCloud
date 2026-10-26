
variable "aws_region" {
  description = "AWS region where resources are deployed"
  type        = string
  default     = "eu-central-1"
}

variable "aws_vpc" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "aws_private_subnet_a" {
  description = "Private subnet CIDR block"
  type        = string
  default     = "10.0.1.0/24"
}

variable "aws_private_subnet_b" {
  description = "Private subnet CIDR block"
  type        = string
  default     = "10.0.2.0/24"
}

variable "aws_public_subnet_a" {
  description = "Public subnet CIDR block"
  type        = string
  default     = "10.0.3.0/24"
}

variable "aws_public_subnet_b" {
  description = "Public subnet CIDR block"
  type        = string
  default     = "10.0.4.0/24"
}

variable "eks_cluster_name" {
  description = "EKS Cluster name"
  type        = string
  default     = "minicloud-eks"
}



variable "eks_cluster_version" {
  description = "Version of the EKS Cluster"
  type        = string
  default     = "1.35"
}

variable "public_access_cidrs" {
  description = "Allowed IP addresses for EKS Cluster"
  type        = list(string)
  default     = ["188.36.177.180/32"]
}

variable "eks_node_instance_type" {
  description = "EC2 instance types"
  type        = list(string)
  default     = ["t3.medium"]
}

variable "eks_node_desired_size" {
  description = "Desired number of worker nodes"
  type        = number
  default     = 1
}

variable "eks_node_min_size" {
  description = "Minimum number of worker nodes"
  type        = number
  default     = 1

  validation {
    condition     = var.eks_node_min_size >= 1
    error_message = "The minimum number of worker nodes must be at least 1."
  }
}

variable "eks_node_max_size" {
  description = "Maximum number of worker nodes"
  type        = number
  default     = 2
}

variable "eks_admin_principal_arn" {
  description = "IAM principal allowed to administer the EKS cluster"
  type        = string
}