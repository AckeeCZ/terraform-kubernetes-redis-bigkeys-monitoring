resource "grafana_dashboard" "grafana_redis_bigkeys" {
  count = var.include_dashboard ? 1 : 0

  folder    = var.grafana_folder_id
  message   = "Provisioned by Terraform, please do not try to overwrite"
  overwrite = true
  config_json = templatefile(
    "${path.module}/dashboard/dashboard.json.tpl",
    {
      project_id = var.project
    }
  )
}
