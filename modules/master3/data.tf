 data "aws_instance" "UST1_Master_node3" {
  filter {
    name   = "tag:Name"
    values = ["UST1_Master_node3"]
  }

  depends_on = [
    aws_instance.UST1_Master_node3
  ]
}