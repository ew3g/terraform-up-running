variable "mysql_db_name" {
  description = "The database name of the MySQL instance"
}

# Set in terminal
# export TF_VAR_db_password=aaaa
variable "db_password" {
  description = "The password for the database"
  type        = string
}

variable "db_user" {
  description = "The user for the database"
  type        = string
}
