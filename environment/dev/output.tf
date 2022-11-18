#### ANSIBLE Host Outputs

output "Ansible_node_IP" {
  value = module.dev_ansible_jenkins.Ansible_node_Pub_IP
}


#### JENKINS Host Outputs

output "Jenkins_host_IP" {
  value = module.dev_ansible_jenkins.Jenkins_Public_ip
}


#### BASTION Host Outputs

output "Bastion_host_IP" {
  value = module.dev_ansible_jenkins.Bastion_Public_ip
}
#### Master Node1 Private IP
output "Master1_IP" {
  value = module.dev_master1-node.Master1_node_IP
}
#### Master Node2 Private IP
output "Master2_IP" {
  value = module.dev_master2-node.Master2_node_IP
}
#### Master Node3 Private IP
output "Master3_IP" {
  value = module.dev_master3-node.Master3_node_IP
}
#### Worker Node1 Private IP
output "Worker1_IP" {
  value = module.dev_worker1_node.Worker1_IP
}
#### Worker Node2 Private IP
output "Worker2_IP" {
  value = module.dev_worker2_node.Worker2_IP
}
#### Worker Node3 Private IP
output "Worker3_IP" {
  value = module.dev_worker3_node.Worker3_IP
}

output "k8s_alb-dns" {
  value = module.dev_loadbalancer.Load_Balancer_dns
}

output "pmt_alb-dns" {
  value = module.dev_loadbalancer.pmt_Load_Balancer_dns
}

output "graf_alb-dns" {
  value = module.dev_loadbalancer.graf_Load_Balancer_dns
}