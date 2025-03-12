terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_namespace" "monitoring" {
  metadata {
    annotations = {
      name = "monitoring"
    }

    labels = {
      namespace = "monitoring"
    }

    name = "monitoring"
  }
}

module "nginx" {
  source = "./modules/ngnx"
  kubernetes_namespace = "default"
}

module "monitoring" {
  source = "./modules/monitoring"
  kubernetes_namespace = kubernetes_namespace.monitoring.metadata.0.name
  grafana_user = "admin"
  grafana_password = "admin"
}
