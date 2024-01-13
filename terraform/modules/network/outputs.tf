output "vpc_id" {
  value = aws_vpc.k8s-vpc.id
}

output "public_subnets_id" {
  value = [for s in aws_subnet.public-subnets : s.id]
}
