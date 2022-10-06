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

variable "redis_instances" {
  description = "Map of redis instances with items in containing fields instance_hostname and instance_database, key is instance_name"
  type        = map(map(string))
  default     = {}
}

variable "include_dashboard" {
  description = "Include dashboard as k8s secret"
  default     = true
}

variable "gke_workload_identity" {
  description = "Add resources need for GKE workload identity setup"
  default     = true
}

variable "grafana_folder_id" {
  description = "ID of Grafana folder where we store dashboard"
  type        = number
  default     = 1
}
