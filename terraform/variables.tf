variable "region" { default = "fra1" }
variable "name"   { default = "my-k8s" }

variable "token"      {}
variable "node_count" { default = 1 }
variable "tags"       { default = ["terraform"] }
variable "k8s_version"    { default = "1.13.2-do.1" }
variable "node_size"      { default = "s-1vcpu-2gb" }

