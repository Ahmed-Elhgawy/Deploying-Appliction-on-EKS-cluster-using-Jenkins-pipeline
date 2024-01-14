output "bastion_publlic_ip" {
  value = aws_instance.bastion-server.public_ip
}