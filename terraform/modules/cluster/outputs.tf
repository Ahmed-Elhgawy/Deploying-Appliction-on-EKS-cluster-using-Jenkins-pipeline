output "cluster_arn" {
  value = aws_eks_cluster.k8s-cluster.arn
}

output "cluster_certificate_authority" {
  value = aws_eks_cluster.k8s-cluster.certificate_authority
}

output "cluster_id" {
  value = aws_eks_cluster.k8s-cluster.id
}

output "cluster_endpoint" {
  value = aws_eks_cluster.k8s-cluster.endpoint
}

output "node_resources" {
  value = aws_eks_node_group.k8s-node-group.resources
}