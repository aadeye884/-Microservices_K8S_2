 data "aws_instance" "Worker3_node" {
  filter {
    name   = "tag:Name"
    values = ["Worker3_node"]
  }

  depends_on = [
    aws_instance.Worker3_node
  ]
}