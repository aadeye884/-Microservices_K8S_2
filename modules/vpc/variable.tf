variable "vpc_cidr" {
    default     = "10.0.0.0/16"
}
variable "vpc_name" {
    default = "UST1K8s_VPC"
}
variable "PubSn1_cidr" {
    default     = "10.0.1.0/24"
}
variable "az1"{
    default = "us-east-1a"
}
variable "PubSn1" {
    default = "PubSn1"
}
variable "PubSn2_cidr" {
    default     = "10.0.2.0/24"
}
variable "az2"{
    default = "us-east-1b"
}
variable "PubSn2" {
    default = "PubSn2"
}
variable "PubSn3_cidr" {
    default     = "10.0.3.0/24"
}
variable "az3"{
    default = "us-east-1c"
}
variable "PubSn3" {
    default = "PubSn3"
}    
variable "igw_name" {
    default = "UST1K8s_IGW"
}
variable "all" {
    default = "0.0.0.0/0"
}
variable "PubSnRT" {
    default = "UST1K8s_PubSnRT"
}
variable "PrvSn1_cidr" {
    default     = "10.0.4.0/24"
}
variable "PrvSn1" {
    default = "PrvSn1"
}
variable "PrvSn2_cidr" {
    default     = "10.0.5.0/24"
}
variable "PrvSn2" {
    default = "PrvSn2"
}
variable "PrvSn3_cidr" {
    default     = "10.0.6.0/24"
}
variable "PrvSn3" {
    default = "PrvSn3"
}
variable "Ngw_name" {
    default = "UST1K8s_NGW" 
}
variable "PrvSnRT" {
    default = "UST1K8s_PrvSnRT"  
}





