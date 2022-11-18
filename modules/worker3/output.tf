output "Worker3_node_IP" {
  value       = aws_instance.Worker3_node.public_ip
  description = "Worker3 public IP"
}
output "Worker3_node_ID" {
  value       = aws_instance.Worker3_node.id
  description = "Worker3 node ID"
}
output "Worker3_ip" {
  value       = data.aws_instance.Worker3_node.private_ip
}
output "Worker3_IP" {
  value = aws_instance.Worker3_node.private_ip
}