output "Usage" {
  value = <<MSG

export KUBECONFIG=${path.module}/${var.name} 
kubectl get nodes
MSG
}
