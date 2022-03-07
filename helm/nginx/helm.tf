provider "helm" {
  #kubernetes {
  #  config_path = "~/.kube/config"
  #}
  kubernetes {
    host                   = data.terraform_remote_state.eks.outputs.cluster_endpoint
    cluster_ca_certificate = base64decode(data.terraform_remote_state.eks.outputs.cluster_ca_cert)
    exec {
      api_version = "client.authentication.k8s.io/v1alpha1"
      args        = ["eks", "get-token", "--cluster-name", data.terraform_remote_state.eks.outputs.cluster_name]
      command     = "aws"
    }
  }
}

resource "helm_release" "nginx_ingress" {
  name = "nginx-ingress-controller"

  repository = "https://charts.bitnami.com/bitnami"
  chart      = "nginx-ingress-controller"

  set {
    name  = "service.type"
    value = "ClusterIP"
  }
}

#resource "helm_release" "nginx_ingress" {
#  name       = "nginx-ingress-controller"
#
#  repository = "https://helm.nginx.com/stable"
#  chart      = "nginx-ingress"
#
#  set {
#    name  = "service.type"
#    value = "ClusterIP"
#  }
#}
