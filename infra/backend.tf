terraform {
  backend "s3" {
    endpoint                    = "storage.yandexcloud.net"
    bucket                      = "tfstate-vp"
    region                      = "ru-central1"
    key                         = "terraform.tfstate"
    skip_region_validation      = true
    skip_credentials_validation = true
    dynamodb_endpoint           = "https://docapi.serverless.yandexcloud.net/ru-central1/b1gnslc43g45sjmstjav/etnq1h9fegbtqiqi217g"
    dynamodb_table              = "tfstate-lock-table"
  }
}