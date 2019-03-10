# digitalocean-k8s
Builds a managed k8s cluster on DigitalOcean with terraform.

## Requirements:
* [Digital Ocean account](https://cloud.digitalocean.com/login) 
* [terraform](https://www.terraform.io/)
* [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/#install-kubectl)

## Optionals
* [make](https://www.gnu.org/software/make/)
* [docker](https://docs.docker.com/)


## TODO
- Add support for Block Storage volumes
- Add support for Load Balancers


## Usage
```shell
$ cd terraform
$ terraform init
$ terraform apply
```

or with make:
``` shell
$ cd terraform
$ make
$ make apply
```

For price and documentation see:
(https://www.digitalocean.com/products/kubernetes/).
