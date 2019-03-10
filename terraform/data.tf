data "digitalocean_kubernetes_cluster" "k8s" {
  name = "${var.name}"

  depends_on = ["digitalocean_kubernetes_cluster.k8s"]
}
