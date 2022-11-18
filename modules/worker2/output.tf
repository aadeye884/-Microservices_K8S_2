output "Worker2_node_IP" {
  value       = aws_instance.Worker2_node.public_ip
  description = "Worker2 public IP"
}
output "Worker2_node_ID" {
  value       = aws_instance.Worker2_node.id
  description = "Worker2 node ID"
}
output "Worker2_ip" {
  value       = data.aws_instance.Worker2_node.private_ip
}
output "Worker2_IP" {
  value = aws_instance.Worker2_node.private_ip
}