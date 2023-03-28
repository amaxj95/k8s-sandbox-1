variable "project_id" {
  type = string
  default = "gold-mode-297211"
}

variable "region" {
  type = string
  default = "us-east1"
}

variable "machine_type" {
  type = string
  default = "e2-small"
}

variable "vpc_name" {
  type = string
  default = "default"
}

variable "subnet_name" {
  type = string
  default = "default"
}

variable "node_count" {
  type = string
  default = 2
}

variable "cluster_name" {
  type = string
  default = "anthosgke"
}
