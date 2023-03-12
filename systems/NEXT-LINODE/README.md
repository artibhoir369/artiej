# terraform-linode-instance


## Usage

Requires your Personal Access Token.

```bash
LINODE_TOKEN="xxxxx"
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=0.14.8 |
| <a name="requirement_linode"></a> [linode](#requirement\_linode) | >=1.25.0 |
| <a name="requirement_local"></a> [local](#requirement\_local) | 2.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_linode"></a> [linode](#provider\_linode) | 1.13.4 |
| <a name="provider_local"></a> [local](#provider\_local) | 2.0.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.0.0 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 3.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [linode_instance.example](https://registry.terraform.io/providers/linode/linode/latest/docs/resources/instance) | resource |
| [local_file.private_ssh](https://registry.terraform.io/providers/hashicorp/local/2.0.0/docs/resources/file) | resource |
| [local_file.public_ssh](https://registry.terraform.io/providers/hashicorp/local/2.0.0/docs/resources/file) | resource |
| [random_password.password](https://registry.terraform.io/providers/hashicorp/random/3.0.0/docs/resources/password) | resource |
| [random_string.firewall](https://registry.terraform.io/providers/linode/linode/latest/docs/resources/firewall) | resource |


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_image"></a> [image](#input\_image) | Linode Image type to use | `string` | `"linode/ubuntu18.04"` | no |
| <a name="input_region"></a> [region](#input\_region) | The Linode region to use | `string` | `"us-southeast"` | no |
| <a name="input_type"></a> [type](#input\_type) | The image size type to use | `string` | `"g6-standard-1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance_id"></a> [instance\_id](#output\_instance\_id) | n/a |
| <a name="output_password"></a> [password](#output\_password) | n/a |
| <a name="output_ssh"></a> [ssh](#output\_ssh) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Tests Urls

```bash
http://139.144.188.91

http://139.144.188.91/docs
```

### Contributors
[gitlab]: https://gitlab.com/advocatediablo/ejs

