resource "kubernetes_deployment" "redis_bigkeys_monitoring" {
  metadata {
    name      = "redis-bigkeys-monitoring"
    namespace = var.namespace
    labels = {
      app = "redis-bigkeys-monitoring"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "redis-bigkeys-monitoring"
      }
    }

    template {
      metadata {
        labels = {
          app = "redis-bigkeys-monitoring"
        }
      }

      spec {
        container {
          image = "ackee/redis_bigkeys:${var.docker_tag}"
          name  = "redis-bigkeys-monitoring"
          env {
            name  = "HOST"
            value = var.redis_host
          }
          env {
            name  = "GCP_PROJECT_ID"
            value = var.project
          }
        }
      }
    }
  }
}
