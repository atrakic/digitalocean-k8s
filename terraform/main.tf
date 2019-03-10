provider "kubernetes" {
  host = "${data.digitalocean_kubernetes_cluster.k8s.endpoint}"
  client_certificate     = "${base64decode(data.digitalocean_kubernetes_cluster.k8s.kube_config.0.client_certificate)}"
  client_key             = "${base64decode(data.digitalocean_kubernetes_cluster.k8s.kube_config.0.client_key)}"
  cluster_ca_certificate = "${base64decode(data.digitalocean_kubernetes_cluster.k8s.kube_config.0.cluster_ca_certificate)}"
  
  depends_on = ["digitalocean_kubernetes_cluster.k8s"]
}

resource "null_resource" "gen_kubeconfig" {
  triggers {
    uuid = "${uuid()}"
  }
  provisioner "local-exec" {
    command = "echo '${data.digitalocean_kubernetes_cluster.k8s.kube_config.0.raw_config}' > ${path.module}/${var.name}"
  }

  depends_on = ["digitalocean_kubernetes_cluster.k8s"]
}

resource "digitalocean_kubernetes_cluster" "k8s" {
  name    = "${var.name}"
  region  = "${var.region}"
  version = "${var.k8s_version}"
  tags    = [ "${join(",", var.tags)}"]

  node_pool {
    node_count = "${var.node_count}"
    name       = "${var.name}-pool"
    size       = "${var.node_size}"
    tags       = ["one", "two"] // Tags from cluster are automatically added to node pools
  }
}
