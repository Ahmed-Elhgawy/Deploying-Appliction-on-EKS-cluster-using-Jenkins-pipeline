resource "aws_instance" "bastion-server" {
  ami             = "ami-027a754129abb5386"
  instance_type   = "t2.micro"
  key_name        = var.ssh-key
  subnet_id = var.subnet-id
  security_groups = var.security-groups

  tags = {
    Name = "Bastion-server"
  }
}