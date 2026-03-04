resource "random_string" "suffix" {
  length  = 4
  upper   = false
  special = false
}

resource "aws_db_instance" "mydb" {
  identifier           = "${var.project}-${var.env}-${random_string.suffix.result}-mydb"
  engine               = "mysql"
  instance_class       = "db.t3.micro"
  allocated_storage    = 20
  username             = "admin"
  password             = himanshu1234
  db_name              = "mydb"
  skip_final_snapshot  = true
  publicly_accessible  = false
}
