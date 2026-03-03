resource "aws_s3_bucket" "frontend" {
  bucket = "${var.project}-${var.env}-frontend"

  tags = {
    Environment = var.env
  }
}