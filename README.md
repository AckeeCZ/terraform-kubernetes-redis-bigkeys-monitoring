# Terraform Google Cloud Redis Big Keys monitoring

Terraform module to create pod which runs `redis-cli --bigkeys`, parse the output and push it into Google Cloud Monitoring.
It also contains dashboard kept as kubernetes secret, which could be parsed by [Grafana](https://github.com/grafana/helm-charts).

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |
| <a name="provider_grafana"></a> [grafana](#provider\_grafana) | n/a |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_project_iam_member.sa](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_service_account.sa](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_service_account_iam_member.sa_allow_iam_workload_identity](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account_iam_member) | resource |
| [grafana_dashboard.grafana_redis_bigkeys](https://registry.terraform.io/providers/grafana/grafana/latest/docs/resources/dashboard) | resource |
| [kubernetes_deployment.redis_bigkeys_monitoring](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/deployment) | resource |
| [kubernetes_service_account.sa](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service_account) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#input\_cluster\_ca\_certificate) | Public CA certificate that is the root of trust for the GKE K8s cluster | `string` | n/a | yes |
| <a name="input_cluster_endpoint"></a> [cluster\_endpoint](#input\_cluster\_endpoint) | Cluster control plane endpoint | `string` | n/a | yes |
| <a name="input_cluster_token"></a> [cluster\_token](#input\_cluster\_token) | Cluster master token, keep always secret! | `string` | n/a | yes |
| <a name="input_docker_tag"></a> [docker\_tag](#input\_docker\_tag) | Tag of image ackee/redis\_bigkeys used for monitoring | `string` | `"latest"` | no |
| <a name="input_gke_workload_identity"></a> [gke\_workload\_identity](#input\_gke\_workload\_identity) | Add resources need for GKE workload identity setup | `bool` | `true` | no |
| <a name="input_grafana_folder_id"></a> [grafana\_folder\_id](#input\_grafana\_folder\_id) | ID of Grafana folder where we store dashboard | `number` | `1` | no |
| <a name="input_include_dashboard"></a> [include\_dashboard](#input\_include\_dashboard) | Include dashboard as k8s secret | `bool` | `true` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace for monitoring deployment containing pod runtime | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Project ID | `any` | n/a | yes |
| <a name="input_redis_instances"></a> [redis\_instances](#input\_redis\_instances) | Map of redis instances with items in containing fields instance\_hostname and instance\_database, key is instance\_name | `map(map(string))` | `{}` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
