resource "kubernetes_secret" "grafana_redis_bigkeys" {
  count = var.include_dashboard ? 1 : 0

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
