module "dev_vpc" {
  source = "../../modules/vpc"
}

module "dev_keypair" {
  source   = "../../modules/keypair"
  key_name = "USTeam1KeyPair"
}

module "dev_security_group" {
  source   = "../../modules/security_group"
  sg_name1 = "K8s_SecurityGroup"
  sg_name2 = "AnsibleSG"
  vpc_id   = module.dev_vpc.vpc-id
}

module "dev_ansible_jenkins" {
  source         = "../../modules/Ansible"
  subnet_id      = module.dev_vpc.subnet-id1
  AnsibleSG      = module.dev_security_group.AnsibleSG_id
  JenkinsSG      = module.dev_security_group.JenkinsSG_id
  BastionSG      = module.dev_security_group.BastionSG_id
  key_name       = module.dev_keypair.key_name
  masternode1_ip = module.dev_master1-node.Master1_IP
  masternode2_ip = module.dev_master2-node.Master2_IP
  masternode3_ip = module.dev_master3-node.Master3_IP
  workernode1_ip = module.dev_worker1_node.Worker1_ip
  workernode2_ip = module.dev_worker2_node.Worker2_ip
  workernode3_ip = module.dev_worker3_node.Worker3_ip
}

module "dev_master1-node" {
  source                 = "../../modules/master1"
  vpc_security_group_ids = [module.dev_security_group.K8sSG]
  key_name               = module.dev_keypair.key_name
  subnet_id              = module.dev_vpc.subnet-id4
  instance_type          = "t2.medium"
  ami                    = "ami-08c40ec9ead489470"
  az1                    = "us-east-1a"
}

module "dev_master2-node" {
  source                 = "../../modules/master2"
  vpc_security_group_ids = [module.dev_security_group.K8sSG]
  key_name               = module.dev_keypair.key_name
  subnet_id              = module.dev_vpc.subnet-id5
  instance_type          = "t2.medium"
  ami                    = "ami-08c40ec9ead489470"
  az2                    = "us-east-1b"
}

module "dev_master3-node" {
  source                 = "../../modules/master3"
  vpc_security_group_ids = [module.dev_security_group.K8sSG]
  key_name               = module.dev_keypair.key_name
  subnet_id              = module.dev_vpc.subnet-id6
  instance_type          = "t2.medium"
  ami                    = "ami-08c40ec9ead489470"
  az3                    = "us-east-1c"
}

module "dev_worker1_node" {
  source                 = "../../modules/worker1"
  vpc_security_group_ids = [module.dev_security_group.K8sSG]
  key_name               = module.dev_keypair.key_name
  subnet_id1             = module.dev_vpc.subnet-id4
  instance_type          = "t2.medium"
  ami                    = "ami-08c40ec9ead489470"
}
module "dev_worker2_node" {
  source                 = "../../modules/worker2"
  vpc_security_group_ids = [module.dev_security_group.K8sSG]
  key_name               = module.dev_keypair.key_name
  subnet_id2             = module.dev_vpc.subnet-id5
  instance_type          = "t2.medium"
  ami                    = "ami-08c40ec9ead489470"
}
module "dev_worker3_node" {
  source                 = "../../modules/worker3"
  vpc_security_group_ids = [module.dev_security_group.K8sSG]
  key_name               = module.dev_keypair.key_name
  subnet_id3             = module.dev_vpc.subnet-id6
  instance_type          = "t2.medium"
  ami                    = "ami-08c40ec9ead489470"
}

module "dev_loadbalancer" {
  source                 = "../../modules/loadbalancer"
  vpc_name               = module.dev_vpc.vpc-id
  vpc_security_group_ids = [module.dev_security_group.K8sSG]
  subnetid1             = [module.dev_vpc.subnet-id1, module.dev_vpc.subnet-id2, module.dev_vpc.subnet-id3]
  worker1                = module.dev_worker1_node.Worker1_node_ID
  worker2                = module.dev_worker2_node.Worker2_node_ID
  worker3                = module.dev_worker3_node.Worker3_node_ID
}

