provider "aws" {
  region = "us-east-2"
}

module "webserver_cluster" {
  source = "../../../modules/webserver-cluster"

  cluster_name           = "webservers-prod"
  db_remote_state_bucket = "(MY BUCKET NAME)"
  db_remote_state_key    = "prod/data-stores/mysl/terraform.tfstate"
}
