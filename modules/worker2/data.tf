 data "aws_instance" "Worker2_node" {
  filter {
    name   = "tag:Name"
    values = ["Worker2_node"]
  }

  depends_on = [
    aws_instance.Worker2_node
  ]
}