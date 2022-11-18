output "K8sSG" {
  value       = aws_security_group.K8sSG.id
}

output "AnsibleSG_id" {
  value       = aws_security_group.AnsibleSG.id
}

output "JenkinsSG_id" {
  value       = aws_security_group.JenkinsSG.id
}

output "BastionSG_id" {
  value       = aws_security_group.BastionSG.id
}
