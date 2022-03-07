resource "helm_release" "mw" {
  name = "mediawiki"

  repository = "https://charts.bitnami.com/bitnami"
  chart      = "mediawiki"

  set { // 	Whether to deploy a mariadb server to satisfy the applications database requirements -- we already have one
    name  = "mariadb.enabled"
    value = "false"
  }
  set {
    name  = "mediawikiHost"
    value = "mediawiki"
  }
  set {
    name  = "externalDatabase.user"
    value = data.terraform_remote_state.db.outputs.username
  }
  set {
    name  = "externalDatabase.password"
    value = data.aws_secretsmanager_secret_version.db_pass.secret_string
  }
  set {
    name  = "externalDatabase.port"
    value = element(split(":", data.terraform_remote_state.db.outputs.endpoint), 1)
  }
  set {
    name  = "externalDatabase.host"
    value = element(split(":", data.terraform_remote_state.db.outputs.endpoint), 0)
  }
  set {
    name  = "externalDatabase.database"
    value = data.terraform_remote_state.db.outputs.dbname
  }
  set {
    name  = "image.debug"
    value = "true"
  }
  set {
    name  = "service.ports.https"
    value = "8443"
  }
  set {
    name  = "service.nodePorts.https"
    value = "8443"
  }
}

data "aws_secretsmanager_secret_version" "db_pass" {
  secret_id = data.terraform_remote_state.db.outputs.passid
}
