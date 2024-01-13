variable "region" {
  type    = string
  default = "us-east-1"
}

variable "cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "availability-zones" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b"]
}

variable "ssh-key" {
  type    = string
  default = "DevOps-KeyPair"
}

variable "instance-type" {
  type    = list(string)
  default = ["t3.medium"]
}

variable "cluster-name" {
  type    = string
  default = "k8s-cluster"
}