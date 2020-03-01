variable "instance_count" {
  default = "1"
}

variable "instance_tags" {
  type    = "list"
  default = ["Master", "Etcd", "Node1", "Node2"]
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ami_key_pair_name" {
  default = "kubernetes"
}
