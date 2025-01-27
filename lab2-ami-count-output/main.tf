provider "aws" {
  region = "ap-south-1"
}

variable "count1" {
  default = 3
}

data "aws_ami" "baseami" {
  most_recent = true
  owners      = ["self"]

  filter {
    name   = "name"
    values = ["app-base-ami"]
  }
}
resource "aws_instance" "apache" {
  ami           = "${data.aws_ami.baseami.id}"
  instance_type = "t2.micro"
  key_name      = "dell-tower"
  count         = "${var.count1}"

  #tags{
  #  Name ="apache-server-${count.index}"
  #}
}

output "public-dns" {
  value = "${aws_instance.apache.*.public_dns}"
}


