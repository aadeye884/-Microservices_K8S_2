
variable "ami" {
  default = "ami-08c40ec9ead489470"
}
variable "instance_type" {
  default = "t2.micro"
}
variable "instance_type2" {
  default = "t2.medium"
}
variable "availability_zone" {
  default = "us-east-1a"
}
variable "associate_public_ip_address" {
  type    = bool
  default = true
}
variable "AnsibleSG" {
  default = ""
}
variable "JenkinsSG" {
  default = ""
}
variable "BastionSG" {
  default = ""
}
variable "subnet_id" {
  default = ""
}
variable "key_name" {
  default = "USTeam1KeyPair"
}
variable "path-to-publickey" {
  default     =  "~/Keypairs/USTeam1KeyPair.pub"
  description = "this is the path to my pub key"
}
# variable "iam_instance_profile" {
#   default     = "Ansible_IAM_instance_profile"  
# }
variable "Ansible_Node_Name" {
  default = "Ansible_Node"
}

variable "join-gen_yaml" {
  default = "~/Sock-Shop-Microservices-Kubernetes-Project-US-Team-1-12SEP/modules/Ansible/join-gen.yaml"
}
variable "join_yaml" {
  default = "~/Sock-Shop-Microservices-Kubernetes-Project-US-Team-1-12SEP/modules/Ansible/join.yaml"
}
variable "deployment_yaml" {
  default = "~/Sock-Shop-Microservices-Kubernetes-Project-US-Team-1-12SEP/modules/Ansible/deployment.yaml"
}
variable "monitoring_yaml" {
  default = "~/Sock-Shop-Microservices-Kubernetes-Project-US-Team-1-12SEP/modules/Ansible/monitoring.yaml"
}
variable "key" {
  default     = "~/Keypairs/USTeam1KeyPair"
  description = "this copies the private key into Ansible .ssh directory"
}

variable "Jenkins_Host_Name" {
  default = "Jenkins_Host"
}

variable "Bastion_Host_Name" {
  default   =  "Bastion_Host"
}

variable "masternode1_ip" {}

variable "masternode2_ip" {}

variable "masternode3_ip" {}

variable "workernode1_ip" {}

variable "workernode2_ip" {}

variable "workernode3_ip" {}
