
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
  depends_on    = [random_string.db_password, random_string.bitbucket_password, random_string.es_password]
  secret_id     = aws_secretsmanager_secret.store.id
  secret_string = <<EOF
   {
    "db_password": "${random_string.db_password.result}",
    "es_password": "${random_string.es_password.result}"
    "bitbucket_password" : "${random_string.bitbucket_password.result}"
   }
EOF
}

data "aws_iam_policy_document" "example" {
  version =  "2012-10-17"
  statement {
    effect    = "Allow"
    actions   = ["secretsmanager:GetSecretValue"]
    resources = ["*"]
    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }
  }
}

resource "aws_secretsmanager_secret_policy" "store_policy" {
  secret_arn = aws_secretsmanager_secret.store.arn
  policy     = data.aws_iam_policy_document.example.json
}

