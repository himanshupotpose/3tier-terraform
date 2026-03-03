resource "aws_instance" "backend" {
  ami           = "ami-019715e0d74f695be"
  instance_type = "t3.micro"
  subnet_id     = var.public_subnet_id

  tags = {
    Name = "${var.project}-${var.env}-backend"
  }
}