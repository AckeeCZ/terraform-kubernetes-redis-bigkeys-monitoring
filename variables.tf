variable "project" {
  description = "Project ID"
}

variable "docker_tag" {
  description = "Tag of image ackee/redis_bigkeys used for monitoring"
  default     = "latest"
  type        = string
}

variable "namespace" {
  description = "Namespace for monitoring deployment containing pod runtime"
  type        = string
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
  description = "Redis machine hostame or ip"
  type        = string
}