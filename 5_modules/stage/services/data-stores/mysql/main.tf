provider "aws" {
    region = "us-east-1"
}

module "mysql" {
    source = "../../../../modules/data-stores/mysql"

    mysql_db_name = "mydb"
    db_user = "myuser"
}