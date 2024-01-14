resource "aws_eks_cluster" "k8s-cluster" {
  name     = var.cluster-name
  role_arn = var.eksClusterRole-arn

  vpc_config {
    subnet_ids = var.public-subnets-id
  }
}

resource "aws_eks_node_group" "k8s-node-group" {
  cluster_name    = aws_eks_cluster.k8s-cluster.name
  node_group_name = "k8s-node-group"
  node_role_arn   = var.AmazonEKSNodeRole-arn
  subnet_ids      = var.public-subnets-id

  launch_template {
   name = var.template-name
   version = var.template-version
  }

  scaling_config {
    desired_size = 1
    max_size     = 3
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }
}