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

variable "template-name" {
  type = string
}

variable "template-version" {
  type = string
}