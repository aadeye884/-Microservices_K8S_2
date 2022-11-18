 data "aws_instance" "UST1_Master_node2" {
  filter {
    name   = "tag:Name"
    values = ["UST1_Master_node2"]
  }

  depends_on = [
    aws_instance.UST1_Master_node2
  ]
}