output "Master1_node_IP" {
  value       = aws_instance.UST1_Master_node1.private_ip
}
output "Master1_IP" {
  value       = data.aws_instance.UST1_Master_node1.private_ip
}