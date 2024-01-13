variable "cluster-name" {
  type = string
}

variable "eksClusterRole-arn" {
  type = string
}

variable "AmazonEKSNodeRole-arn" {
  type = string
}

variable "public-subnets-id" {
  type = list(string)
}

variable "instance-types" {
  type = list(string)
}

variable "ssh-key" {
  type = string
}

variable "remote-access-sg-id" {
  type = string
}