resource "aws_security_group" "storage-sg" {
  name        = "Storage-SG"
  description = "Allow TLS inbound traffic to EFS storage"
  vpc_id      = var.vpc-id

  ingress {
    description = "Allow port 2049 to EFS Storage"
    protocol    = "tcp"
    from_port   = 2049
    to_port     = 2049
    cidr_blocks = [var.cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Storage-SG"
  }
}

resource "aws_security_group" "remote-access-sg" {
  name        = "Remote-Access-SG"
  description = "Allow SSH inbound traffic to node in kuberentes cluster"
  vpc_id      = var.vpc-id

  ingress {
    description = "Allow SSH trafic"
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}

