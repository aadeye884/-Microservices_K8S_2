output "Master3_node_IP" {
  value       = aws_instance.UST1_Master_node3.private_ip
}
output "Master3_IP" {
  value       = data.aws_instance.UST1_Master_node3.private_ip
}