resource "aws_ecs_task_definition" "wearslotapi" {

  family                   = "app"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]

  # container_definitions = file("containers/definations.json")
  container_definitions = <<DEFINITION
  [
    {
      "name": "my-first-task",
      "image": "${aws_ecr_repository.wearslot_ecr_repo.repository_url}",
      "essential": true,
      "portMappings": [
        {
          "containerPort": 3000,
          "hostPort": 3000
        }
      ],
      "memory": 512,
      "cpu": 256
    }
  ]
  DEFINITION
  memory                = 512 # Specifying the memory our container requires
  cpu                   = 256 # Specifying the CPU our container requires
}
