resource "aws_ecr_repository" "api_repo" {

  name = "${var.project_name}-api"
  image_tag_mutability = "MUTABLE"

  # image_scanning_configuration {
  #   scan_on_push = true
  # }
}

# resource "aws_ecr_repository" "marketplace_repo" {

#   name = "${var.project_name}-marketplace"
#   image_tag_mutability = "MUTABLE"

#   # image_scanning_configuration {
#   #   scan_on_push = true
#   # }
# }

resource "aws_ecr_repository" "store_manager_repo" {

  name = "${var.project_name}-store-manager"
  image_tag_mutability = "MUTABLE"

  # image_scanning_configuration {
  #   scan_on_push = true
  # }
}
