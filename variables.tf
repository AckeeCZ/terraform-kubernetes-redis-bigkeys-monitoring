variable "project" {
}

variable "docker_tag" {
  default = "latest"
}

variable "namespace" {
}

variable "cluster_ca_certificate" {
  description = "Public CA certificate that is the root of trust for the GKE K8s cluster"
  type        = string
}

variable "cluster_token" {
  description = "Cluster master token, keep always secret!"
  type        = string
}

variable "cluster_endpoint" {
  description = "Cluster control plane endpoint"
  type        = string
}

variable "redis_host" {
  default = ""
}