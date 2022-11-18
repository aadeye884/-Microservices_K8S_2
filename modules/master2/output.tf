output "Master2_node_IP" {
  value       = aws_instance.UST1_Master_node2.private_ip
}
output "Master2_IP" {
  value       = data.aws_instance.UST1_Master_node2.private_ip
}