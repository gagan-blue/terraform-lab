#notice that provider is not defined here

resource "aws_instance" "ec2vm" {
  ami           = "${var.ami_id}"
  instance_type = "${var.ec2_type}"
  key_name = "${var.kp}"

}

output "instance_ids" {
  value = "${aws_instance.ec2vm.id}"
}
