resource "aws_launch_template" "k8s_template" {
  name = "k8s_template"

  vpc_security_group_ids = var.security-groups-id

  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      volume_size = 20
      volume_type = "gp2"
    }
  }

  image_id = "ami-01b20f5ea962e3fe7"
  instance_type = "t3.medium"
  key_name = var.ssh-key
  user_data = "./userdata"

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "EKS-MANAGED-NODE"
    }
  }
}
