resource "aws_vpc" "k8s-vpc" {
  cidr_block = var.cidr

  tags = {
    Name = "K8s-VPC"
  }
}

resource "aws_internet_gateway" "k8s-igw" {
  vpc_id = aws_vpc.k8s-vpc.id

  tags = {
    Name = "K8s-IGW"
  }
}

resource "aws_subnet" "public-subnets" {
  count                   = length(var.availability-zones)
  vpc_id                  = aws_vpc.k8s-vpc.id
  cidr_block              = cidrsubnet(var.cidr, 8, count.index + 1)
  availability_zone       = var.availability-zones[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-${count.index + 1}"
  }
}

resource "aws_route_table" "publib-rt" {
  vpc_id = aws_vpc.k8s-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.k8s-igw.id
  }

  tags = {
    Name = "public-RT"
  }
}

resource "aws_route_table_association" "public-rt-association" {
  count          = length(var.availability-zones)
  subnet_id      = aws_subnet.public-subnets[count.index].id
  route_table_id = aws_route_table.publib-rt.id
}