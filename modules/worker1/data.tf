 data "aws_instance" "Worker1_node" {
  filter {
    name   = "tag:Name"
    values = ["Worker1_node"]
  }

  depends_on = [
    aws_instance.Worker1_node
  ]
}