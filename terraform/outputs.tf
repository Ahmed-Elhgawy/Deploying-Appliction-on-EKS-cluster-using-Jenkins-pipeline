output "vpc_id" {
  value = module.network.vpc_id
}

output "efs_id" {
  value = module.storage.efs_id
}

output "cluster_arn" {
  value = module.cluster.cluster_arn
}

output "cluster_certificate_authority" {
  value = module.cluster.cluster_certificate_authority
}

output "cluster_id" {
  value = module.cluster.cluster_id
}

output "cluster_endpoint" {
  value = module.cluster.cluster_endpoint
}

output "node_resources" {
  value = module.cluster.node_resources
}
