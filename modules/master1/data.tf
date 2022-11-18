 data "aws_instance" "UST1_Master_node1" {
  filter {
    name   = "tag:Name"
    values = ["UST1_Master_node1"]
  }

  depends_on = [
    aws_instance.UST1_Master_node1
  ]
}