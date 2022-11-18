######K8s
variable "sg_name1" {
  default     = ""
}
variable "open2all" {
    default = ["0.0.0.0/0"]
    description = "this cidr block is open to the world"
}
variable "vpc_id" {
  default     = ""
}
variable "from_port" {
  default     = 0
  description = "this port allows ssh access"
}

variable "to_port" {
  default     = 65535
  description = "this port allows http access"
}

#####ANSIBLE
variable "ssh_port" {
  default     = 22
  description = "this port allows ssh access"
}

variable "sg_name2" {
  default     = ""
}

#####JENKINS

variable "Jenkins_port" {
  default     = 8080
  description = "this port allows Jenkins access"
}

variable "sg_name3" {
  default     = ""
}

#####BASTION
variable "ssh_port2" {
  default     = 22
  description = "this port allows ssh access"
}

variable "sg_name4" {
  default     = ""
}