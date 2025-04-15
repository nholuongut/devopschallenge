variable "resource_group_name" {
  default = "rg-devopschallenge"
}

variable "location" {
  default = "eastus"
}

variable "app_name" {
  default = "devopschallenge"
}

variable "docker_image" {
  description = "DockerHub image name"
  type        = string
}
