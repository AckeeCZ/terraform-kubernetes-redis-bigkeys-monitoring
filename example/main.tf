provider "random" {}

provider "google" {}

provider "google-beta" {}

provider "vault" {}

provider "kubernetes" {}

provider "helm" {}

module "redis_bigkeys" {
  source                 = "../"
  project                = var.project
  namespace              = var.namespace
  cluster_ca_certificate = module.gke.cluster_ca_certificate
  cluster_token          = module.gke.access_token
  cluster_endpoint       = module.gke.endpoint
  redis_host             = module.redis.google_redis_instance_hostname
}

module "redis" {
  source                 = "AckeeCZ/redis/memorystore"
  version                = "3.2.0"
  instance_name          = "fn-papillon-cache"
  redis_version          = "REDIS_5_0"
  project                = var.project
  namespace              = var.namespace
  cluster_ca_certificate = module.gke.cluster_ca_certificate
  cluster_token          = module.gke.access_token
  cluster_endpoint       = module.gke.endpoint
}

module "gke" {
  source            = "git::ssh://git@gitlab.ack.ee/Infra/terraform-gke-vpc.git?ref=v9.5.0"
  cluster_name      = "postgresql-cluster-test"
  namespace         = var.namespace
  project           = var.project
  location          = var.zone
  vault_secret_path = var.vault_secret_path
  private           = false
  min_nodes         = 1
  max_nodes         = 2
}

variable "environment" {
  default = "development"
}

variable "namespace" {
  default = "stage"
}

variable "project" {
}

variable "vault_secret_path" {
}

variable "region" {
  default = "europe-west3"
}

variable "zone" {
  default = "europe-west3-c"
}
