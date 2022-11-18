# Create Kubernetes Security Group
resource "aws_security_group" "K8sSG" {
  name        = var.sg_name1
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "all traffic from VPC"
    from_port   = var.from_port
    to_port     = var.to_port
    protocol    = "tcp"
    cidr_blocks = var.open2all
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = var.open2all
  }

  tags = {
    Name = var.sg_name1 
  }
}

# Create Ansible Security Group
resource "aws_security_group" "AnsibleSG" {
  name        = var.sg_name2
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "all traffic from VPC"
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
    cidr_blocks = var.open2all
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = var.open2all
  }

  tags = {
    Name = var.sg_name2 
  }
}

# Create Jenkins Security Group
resource "aws_security_group" "JenkinsSG" {
  name        = var.sg_name3
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "all traffic from VPC"
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
    cidr_blocks = var.open2all
  }

  ingress {
    description = "all traffic from VPC"
    from_port   = var.Jenkins_port
    to_port     = var.Jenkins_port
    protocol    = "tcp"
    cidr_blocks = var.open2all
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = var.open2all
  }

  tags = {
    Name = var.sg_name3 
  }
}


# Create Bastion Security Group
resource "aws_security_group" "BastionSG" {
  name        = var.sg_name4
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "all traffic from VPC"
    from_port   = var.ssh_port2
    to_port     = var.ssh_port2
    protocol    = "tcp"
    cidr_blocks = var.open2all
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = var.open2all
  }

  tags = {
    Name = var.sg_name4 
  }
}


