resource "aws_db_instance" "default" {
  engine         = "mysql"
  engine_version ="8.0.28"
  instance_class = "db.t3.micro"
  name           = "initial_db"
  username       = "rootuser"
  password       = "rootpasswd"
  allocated_storage = 10

  # etc, etc; see aws_db_instance docs for more
}

terraform {
  required_version = ">= 0.13.0"

  required_providers {


  mysql = {
      source  = "terraform-providers/mysql"
      version = ">= 1.5"
    }
  }
}
# Configure the MySQL provider based on the outcome of
# creating the aws_db_instance.
provider "mysql" {
  endpoint = "${aws_db_instance.default.endpoint}"
  username = "${aws_db_instance.default.username}"
  password = "${aws_db_instance.default.password}"
  # access_key = var.access_key
  # secret_key = var.secret_key
}

# Create a second database, in addition to the "initial_db" created
# by the aws_db_instance resource above.
# resource "mysql_database" "app" {
#   name = "another_db"
# }