provider "aws" {
  region = "us-east-2"
}

data "aws_region" "current" {}

resource "aws_dynamodb_table" "test_table_a" {
  tags                        = "null"
  deletion_protection_enabled = true
  billing_mode                = "PAY_PER_REQUEST"
  server_side_encryption {
    enabled = false
  }
}

resource "aws_lambda_function" "myfunction" {
  tracing_config {
    mode = "Active"
  }
}

resource "aws_appsync_graphql_api" "test_api" {
  authentication_type = "API_KEY"
  xray_enabled        = true
}

resource "aws_keyspaces_table" "mykeyspacestable" {
  encryption_specification {
    kms_key_identifier = "null"
    type               = "CUSTOMER_MANAGED_KMS_KEY"
  }
}