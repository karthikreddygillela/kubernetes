provider "aws" {
  access_key = ""
  secret_key = ""
  region     = "ap-south-1"
}

resource "aws_instance" "kube_cluster" {
  ami           = "ami-0620d12a9cf777c87"
  instance_type = "${var.instance_type}"
  count         = "${var.instance_count}"

  #security_groups = ["sg-0cff75c80660dc00c", "kubernetes"]
  key_name  = "${var.ami_key_pair_name}"
  user_data = "${file("pre_install.sh")}"

  provisioner "local-exec" {
    command = "echo ${aws_instance.kube_cluster.private_ip} >> private_ip.txt"
    command = "cat /home/ubuntu/.ssh/id_rsa.pub >> key.txt"
  }

  tags = {
    name = "${element(var.instance_tags, count.index)}"
  }
}

output "ip" {
  value = "${aws_instance.kube_cluster.*.private_ip}"
}
