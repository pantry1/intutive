
resource "aws_secretsmanager_secret" "store" {
  name = "SecretStore-${var.cluster_name}"
}

resource "random_string" "db_password" {
  length  = 10
  special = true
  upper   = false
  
}

resource "random_string" "es_password" {
  length  = 10
  special = true
  upper   = false
  
}

resource "random_string" "bitbucket_password" {
  length  = 10
  special = true
  upper   = false
  
}


resource "aws_secretsmanager_secret_version" "store_values" {
  depends_on = [ random_string.db_password, random_string.bitbucket_password, random_string.es_password ]
  secret_id     = aws_secretsmanager_secret.store.id
  secret_string = <<EOF
   {
    "db_username": "${var.db_username}",
    "db_password": "${random_string.db_password.result}",
    "es_username": "${var.es_username}",
    "es_password": "${random_string.es_password.result}"
    "bitbucket_username": "${var.bitbucket_username}",
    "bitbucket_password" : "${random_string.bitbucket_password.result}"
    "bitbucket_displayName": "${var.bitbucket_displayNamen}",
    "bitbucket_emailAddress": "${var.bitbucket_emailAddress}"
   }
EOF
}


