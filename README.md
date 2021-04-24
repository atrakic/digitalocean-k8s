# digitalocean-k8s
[![CircleCI](https://circleci.com/gh/atrakic/digitalocean-k8s.svg?style=svg)](https://circleci.com/gh/atrakic/digitalocean-k8s)

Terraform module that builds a managed k8s cluster on DigitalOcean with Terraform.

## Requirements:
* [Digital Ocean account](https://cloud.digitalocean.com/login) 
* [Terraform](https://www.terraform.io/)
* [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/#install-kubectl)

## Optionals
* [make](https://www.gnu.org/software/make/)
* [docker](https://docs.docker.com/)

## Usage
```shell
$ cd terraform
$ terraform init
$ terraform apply
```

or with make:
``` shell
$ cd terraform
$ export DIGITALOCEAN_TOKEN="YOUR_TOKEN"
$ make
$ make apply
$ make output # prints usage instructions with kubectl
```

or as terraform module:
``` hcl
module "my_do_k8s" {
  source  = "github.com/atrakic/digitalocean-k8s/terraform"

  name       = "do-k8s"
  token      = "${var.token}"

  # optionals
  region     = "ams2"    # https://www.digitalocean.com/docs/platform/availability-matrix/
  node_count = "3"
}
``` 

# Kubeconfig
After cluster creation, new file would be autogenerated (depending of cluster name), which you would need to use in order to access your cluster nodes:
``` shell
$ cd terraform
$ terraform output
$ export KUBECONFIG=do-k8s
$ kubectl cluster-info
$ kubectl get nodes
```

Please refer to kubectl documentation about how to use this file: (https://kubernetes.io/docs/concepts/configuration/organize-cluster-access-kubeconfig/)

For price and documentation:
(https://www.digitalocean.com/products/kubernetes/).

## TODO
- Add support for Block Storage volumes
- Add support for Load Balancers

## License
digitalocean-k8s is licensed under the MIT license.

See [LICENSE.md](https://github.com/atrakic/digitalocean-k8s/blob/master/LICENSE.md) for the full license text.
