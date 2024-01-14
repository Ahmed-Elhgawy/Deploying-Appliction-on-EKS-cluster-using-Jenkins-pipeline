output "template_name" {
  value = aws_launch_template.k8s_template.name
}

output "template_version" {
  value = aws_launch_template.k8s_template.latest_version
}
