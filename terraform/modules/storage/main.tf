resource "aws_efs_file_system" "k8s-efs" {
  creation_token         = "K8s-EFS"
  availability_zone_name = var.availability-zones[0]

  tags = {
    Name = "K8s-EFS"
  }
}

resource "aws_efs_mount_target" "k8s-efs-mt" {
  file_system_id = aws_efs_file_system.k8s-efs.id
  subnet_id      = var.subnet-id
  security_groups = var.storage-sg-id
}