# Terraform Google Cloud Redis Big Keys monitoring

Terraform module to create pod which runs `redis-cli --bigkeys`, parse the output and push it into Google Cloud Monitoring.
It also contains dashboard kept as kubernetes secret, which could be parsed by [Grafana](https://github.com/grafana/helm-charts).

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubernetes_deployment.redis_bigkeys_monitoring](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/deployment) | resource |
| [kubernetes_secret.grafana_redis_bigkeys](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#input\_cluster\_ca\_certificate) | Public CA certificate that is the root of trust for the GKE K8s cluster | `string` | n/a | yes |
| <a name="input_cluster_endpoint"></a> [cluster\_endpoint](#input\_cluster\_endpoint) | Cluster control plane endpoint | `string` | n/a | yes |
| <a name="input_cluster_token"></a> [cluster\_token](#input\_cluster\_token) | Cluster master token, keep always secret! | `string` | n/a | yes |
| <a name="input_docker_tag"></a> [docker\_tag](#input\_docker\_tag) | Tag of image ackee/redis\_bigkeys used for monitoring | `string` | `"latest"` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace for monitoring deployment containing pod runtime | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Project ID | `any` | n/a | yes |
| <a name="input_redis_host"></a> [redis\_host](#input\_redis\_host) | Redis machine hostame or ip | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
