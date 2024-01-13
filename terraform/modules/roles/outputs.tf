output "eksClusterRole_arn" {
  value = aws_iam_role.eksClusterRole.arn
}

output "AmazonEKSNodeRole_arn" {
  value = aws_iam_role.AmazonEKSNodeRole.arn
}
