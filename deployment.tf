resource "kubernetes_deployment" "redis_bigkeys_monitoring" {
  for_each = var.redis_instances

  metadata {
    name      = "redis-bigkeys-monitoring-${each.key}"
    namespace = var.namespace
    labels = {
      app = "redis-bigkeys-monitoring-${each.key}"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "redis-bigkeys-monitoring-${each.key}"
      }
    }

    template {
      metadata {
        labels = {
          app = "redis-bigkeys-monitoring-${each.key}"
        }
      }

      spec {
        service_account_name = var.gke_workload_identity ? "redis-bigkeys-monitoring-${each.key}" : null
        container {
          image = "ackee/redis_bigkeys:${var.docker_tag}"
          name  = "redis-bigkeys-monitoring-${each.key}"
          env {
            name  = "HOST"
            value = lookup(each.value, "instance_hostname", null)
          }
          env {
            name  = "GCP_PROJECT_ID"
            value = var.project
          }
          env {
            name  = "DATABASE"
            value = lookup(each.value, "instance_database", "5")
          }
          env {
            name  = "SLEEP"
            value = lookup(each.value, "instance_collection_interval_sleep", "300")
          }
        }
      }
    }
  }
}
