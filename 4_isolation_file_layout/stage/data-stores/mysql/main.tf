provider "aws" {
  region = "us-east-2"
}

# Setting our backend to store tfstate files on s3
# terraform {
#   backend "s3" {
#     # Use the bucket created on ../global/s3
#     bucket = "terraform-up-and-running-state-my-test-edilson"
#     key    = "stage/data-stores/mysql/terraform.tfstate"
#     region = "us-east-2"

#     # Use the dynamoDB table created on 2_s3_backend_state_files
#     dynamodb_table = "terraform-up-and-running-locks"
#     encrypt        = true
#   }
# }

resource "aws_db_instance" "example" {
  identifier_prefix = "terraform-up-and-running"
  engine            = "mysql"
  allocated_storage = 10
  instance_class    = "db.t2.micro"
  db_name           = "example_database"
  username          = "admin"

  # How should we set the password
  # 1 - Using secrets manager
  # data.aws_secretsmanager_secret_version.db_password.secret_string

  # 2 - Using a environment variable
  password = var.db_password

  apply_immediately       = true
  backup_retention_period = 0
  skip_final_snapshot     = true

}

# data "aws_secretsmanager_secret_version" "db_password" {
#     secret_id = "mysql-master-password-stage"
# }
