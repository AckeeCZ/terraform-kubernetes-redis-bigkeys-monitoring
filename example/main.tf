provider "random" {}

provider "google" {}

provider "google-beta" {}

provider "vault" {}

provider "kubernetes" {
  host                   = "https://${module.gke.endpoint}"
  token                  = module.gke.access_token
  cluster_ca_certificate = module.gke.cluster_ca_certificate
}

provider "helm" {
  kubernetes {
    cluster_ca_certificate = module.gke.cluster_ca_certificate
    token                  = module.gke.access_token
    host                   = "https://${module.gke.endpoint}"
  }
}

locals {
  grafana_host = "grafana.example.com"
}

provider "grafana" {
  url  = "https://${local.grafana_host}"
  auth = "${module.grafana.admin_user}:${module.grafana.admin_pass}"
}

module "grafana" {
  source                     = "git::ssh://git@gitlab.ack.ee/Infra/tf-module/grafana.git?ref=v4.1.0"
  project                    = var.project
  namespace                  = var.namespace
  region                     = var.region
  zone                       = var.zone
  gke_cluster_ca_certificate = module.gke.cluster_ca_certificate
  gke_cluster_token          = module.gke.access_token
  gke_cluster_endpoint       = module.gke.endpoint
  ingress_host               = local.grafana_host
  oauth_client_id            = "dummy"
  oauth_client_secret        = "dummy"
  smtp_user                  = "apikey"
  smtp_pass                  = "dummy"
}

module "redis_bigkeys" {
  source                 = "../"
  project                = var.project
  namespace              = var.namespace
  cluster_ca_certificate = module.gke.cluster_ca_certificate
  cluster_token          = module.gke.access_token
  cluster_endpoint       = module.gke.endpoint
  include_dashboard      = false
  redis_instances = {
    "fn-cache" : {
      "instance_hostname" : module.redis.google_redis_instance_hostname
    }
  }
}

module "redis" {
  source                 = "AckeeCZ/redis/memorystore"
  version                = "3.2.0"
  instance_name          = "cache"
  redis_version          = "REDIS_5_0"
  project                = var.project
  namespace              = var.namespace
  cluster_ca_certificate = module.gke.cluster_ca_certificate
  cluster_token          = module.gke.access_token
  cluster_endpoint       = module.gke.endpoint
}

module "gke" {
  source            = "git::ssh://git@gitlab.ack.ee/Infra/terraform-gke-vpc.git?ref=v11.8.0"
  cluster_name      = "redis-cluster-test"
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
