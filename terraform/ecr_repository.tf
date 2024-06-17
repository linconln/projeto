resource "aws_ecr_repository" "ada" {
  name                 = "projeto"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}