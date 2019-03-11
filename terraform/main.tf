resource "digitalocean_kubernetes_cluster" "k8s" {
  name    = "${var.name}"
  region  = "${var.region}"
  version = "${var.k8s_version}"
  tags    = [ "${join(",", var.tags)}"]

  node_pool {
    node_count = "${var.node_count}"
    name       = "${var.name}-pool"
    size       = "${var.node_size}"
    tags       = ["${var.name}"] 
  }
}
