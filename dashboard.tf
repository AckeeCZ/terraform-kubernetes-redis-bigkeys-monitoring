resource "kubernetes_secret" "grafana_redis_bigkeys" {
  metadata {
    name      = "grafana-redis-bigkeys"
    namespace = var.namespace
    labels = {
      grafana_dashboard = "true"
    }
    annotations = {
      "grafana_folder" = "/tmp/dashboards/infra"
    }
  }

  data = {
    "redis.json" = templatefile(
      "${path.module}/dashboard/dashboard.json.tpl",
      {
        project_id = var.project
      }
    )
  }
}
