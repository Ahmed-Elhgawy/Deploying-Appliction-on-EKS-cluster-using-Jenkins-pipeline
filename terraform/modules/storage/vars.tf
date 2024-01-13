variable "availability-zones" {
  type = list(string)
}

variable "subnet-id" {
  type = string
}

variable "storage-sg-id" {
    type = list(string)
}
