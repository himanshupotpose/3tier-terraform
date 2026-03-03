resource "aws_db_instance" "db" {
  identifier = "${var.project}-${var.env}-db"
  engine = "mysql"
  instance_class = "db.t3.micro"
  allocated_storage = 20
  username = "admin"
  password = "Password123"
  skip_final_snapshot = true
  publicly_accessible = false
}