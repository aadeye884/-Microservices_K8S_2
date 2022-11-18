################################################################################
# ANSIBLE SERVER
################################################################################
# Provision Ansible Host
resource "aws_instance" "Ansible_Node" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.AnsibleSG]
  associate_public_ip_address = var.associate_public_ip_address
  availability_zone           = var.availability_zone
  # iam_instance_profile        = var.iam_instance_profile

  # provisioner "file" {
  #   source      = "~/Keypairs/USTeam1KeyPair"
  #   destination = "~/home/ubuntu/USTeam1KeyPair"
  # }
  # connection {
  #   type        = "ssh"
  #   user        = "ubuntu"
  #   private_key = file("~/Keypairs/USTeam1KeyPair")
  #   host        = self.public_ip
  # }

  user_data = <<-EOF
#!/bin/bash
sudo apt-get update -y
sudo lsb_release -a
sudo apt-get install software-properties-common -y
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt-get install ansible -y
echo "${file(var.key)}" >> /home/ubuntu/USTeam1KeyPair
sudo chmod 400 USTeam1KeyPair
sudo chown ubuntu:ubuntu USTeam1KeyPair
cd ~/etc/ansible
sudo chown -R ubuntu:ubuntu /etc/ansible
echo "${file(var.join-gen_yaml)}" >> /etc/ansible/cluster.yaml
echo "${file(var.join_yaml)}" >> /etc/ansible/join.yaml
echo "${file(var.deployment_yaml)}" >> /etc/ansible/deployment.yaml
echo "${file(var.monitoring_yaml)}" >> /etc/ansible/monitoring.yaml
sudo echo "[Master]" >> /etc/ansible/hosts
sudo echo "${var.masternode1_ip}   ansible_ssh_private_key_file=/home/ubuntu/USTeam1KeyPair" >> /etc/ansible/hosts
sudo echo "[Masters]" >> /etc/ansible/hosts
sudo echo "${var.masternode2_ip}   ansible_ssh_private_key_file=/home/ubuntu/USTeam1KeyPair" >> /etc/ansible/hosts
sudo echo "${var.masternode3_ip}   ansible_ssh_private_key_file=/home/ubuntu/USTeam1KeyPair" >> /etc/ansible/hosts
sudo echo "[Workers]" >> /etc/ansible/hosts
sudo echo "${var.workernode1_ip}   ansible_ssh_private_key_file=/home/ubuntu/USTeam1KeyPair" >> /etc/ansible/hosts
sudo echo "${var.workernode2_ip}   ansible_ssh_private_key_file=/home/ubuntu/USTeam1KeyPair" >> /etc/ansible/hosts
sudo echo "${var.workernode3_ip}   ansible_ssh_private_key_file=/home/ubuntu/USTeam1KeyPair" >> /etc/ansible/hosts
sudo echo "[all:vars]" >> /etc/ansible/hosts
sudo echo "ansible_ssh_common_args='-o StrictHostKeyChecking=no'" >> /etc/ansible/hosts
sudo hostnamectl set-hostname Ansible
EOF

  tags = {
    Name = var.Ansible_Node_Name
  }
}

# data "aws_instance" "Ansible_Node" {
#   filter {
#     name   = "tag:Name"
#     values = ["Ansible_Node"]
#   }

#   depends_on = [
#     aws_instance.Ansible_Node
#   ]
# }



################################################################################
# JENKINS SERVER
################################################################################
resource "aws_instance" "Jenkins_Host" {
  ami                         = var.ami
  instance_type               = var.instance_type2
  subnet_id                   = var.subnet_id
  key_name                    = var.key_name
  vpc_security_group_ids      = [var.JenkinsSG]
  associate_public_ip_address = var.associate_public_ip_address
  
  user_data                   = <<-EOF
#!/bin/bash
sudo apt update -y
sudo apt install default-jre -y
sudo apt install default-jdk -y
echo 'JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"' >> /etc/environment
# sudo nano /etc/environment
# JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"
source /etc/environment
echo $JAVA_HOME
sudo wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key |sudo gpg --dearmor -o /usr/share/keyrings/jenkins.gpg
sudo sh -c 'echo deb [signed-by=/usr/share/keyrings/jenkins.gpg] http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update -y
sudo apt upgrade -y
sudo apt install jenkins -y
sudo systemctl start jenkins.service
sudo ufw allow 8080
sudo hostnamectl set-hostname Jenkins
EOF

  tags = {
    Name = var.Jenkins_Host_Name
  }
}


resource "aws_instance" "Bastion_Host" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  key_name                    = var.key_name
  vpc_security_group_ids      = [var.BastionSG]
  associate_public_ip_address = var.associate_public_ip_address
  # provisioner "file" {
  #   source      = "~/Keypairs/USTeam1Keypair"
  #   destination = "~/home/ubuntu/USTeam1Keypair"
  # }
  # connection {
  #   type        = "ssh"
  #   user        = "ubuntu"
  #   private_key = file("~/Keypairs/USTeam1Keypair")
  #   host        = self.public_ip
  # }
  user_data = <<-EOF
#!/bin/bash
echo "${file(var.key)}" >> /home/ubuntu/USTeam1Keypair
sudo chmod 400 USTeam1Keypair
sudo hostnamectl set-hostname Bastion
EOF
  tags = {
    Name = var.Bastion_Host_Name
  }
}