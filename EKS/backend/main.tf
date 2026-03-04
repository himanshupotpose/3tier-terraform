# Random suffix generate karne ke liye
resource "random_string" "suffix" {
  length  = 4
  special = false
  upper   = false
}

# EKS Cluster
resource "aws_eks_cluster" "eks" {
  name     = "${var.project}-${var.env}-eks"
  role_arn = aws_iam_role.eks_role.arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }
}

# IAM Role with unique name
resource "aws_iam_role" "eks_role" {
  name = "${var.project}-${var.env}-eks-role-${random_string.suffix.result}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "eks.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

# Attach EKS Cluster Policy
resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
  role       = aws_iam_role.eks_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}
