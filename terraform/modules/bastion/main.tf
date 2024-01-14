resource "aws_instance" "bastion-server" {
  ami             = "ami-027a754129abb5386"
  instance_type   = "m2.micro"
  key_name        = var.ssh-key
  security_groups = var.security-groups

  tags = {
    Name = "Bastion-server"
  }
}