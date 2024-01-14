variable "ssh-key" {
  type = string
}

variable "subnet-id" {
  type = string
}

variable "security-groups" {
  type = list(string)
}