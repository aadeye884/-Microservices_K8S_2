#### ANSIBLE Host Outputs

output "Ansible_node_Pub_IP" {
  value = aws_instance.Ansible_Node.public_ip
}


### JENKINS Host Outputs

output "Jenkins_Public_ip" {
  value = aws_instance.Jenkins_Host.public_ip
}


### BASTION Host Outputs

output "Bastion_Public_ip" {
    value = aws_instance.Bastion_Host.public_ip
}