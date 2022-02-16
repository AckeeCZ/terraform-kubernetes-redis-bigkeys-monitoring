resource "google_service_account" "sa" {
  for_each     = toset([for i in keys(var.redis_instances) : i if var.gke_workload_identity])
  account_id   = "redis-bk-${each.key}"
  display_name = "redis-bk-${each.key}"
}

resource "kubernetes_service_account" "sa" {
  for_each = toset([for i in keys(var.redis_instances) : i if var.gke_workload_identity])
  metadata {
    namespace = var.namespace
    name      = "redis-bigkeys-monitoring-${each.key}"
    annotations = {
      "iam.gke.io/gcp-service-account" : google_service_account.sa[each.key].email
    }
  }
}

resource "google_service_account_iam_member" "sa_allow_iam_workload_identity" {
  for_each           = toset([for i in keys(var.redis_instances) : i if var.gke_workload_identity])
  service_account_id = google_service_account.sa[each.key].name
  role               = "roles/iam.workloadIdentityUser"
  member             = "serviceAccount:${var.project}.svc.id.goog[${var.namespace}/redis-bigkeys-monitoring-${each.key}]"
}

resource "google_project_iam_member" "sa" {
  for_each = toset([for i in keys(var.redis_instances) : i if var.gke_workload_identity])
  project  = var.project
  role     = "roles/monitoring.metricWriter"
  member   = "serviceAccount:${google_service_account.sa[each.key].email}"
}
