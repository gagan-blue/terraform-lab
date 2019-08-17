provider "aws" {
  region     = "ap-south-1"
}

resource "aws_instance" "apache" {
  ami           = "ami-0693ef8916d694a6b"
  instance_type = "t2.micro"
  count=2
  key_name = "dell-tower" # can also use 'data' to access list of all key-pair resources

}

output "public-dns" {
 value = "${aws_instance.apache.*.public_dns}"
}

#terraform output public-dns
    #[
    #  "ec2-13-232-177-218.ap-south-1.compute.amazonaws.com",
    #   "ec2-13-233-168-159.ap-south-1.compute.amazonaws.com",
    #]



#echo "aws_instance.apache.0.public_dns" | terraform console
    #ec2-13-232-177-218.ap-south-1.compute.amazonaws.com
#gagan-Tower> echo "aws_instance.apache.1.public_dns" | terraform console
    #ec2-13-233-168-159.ap-south-1.compute.amazonaws.com
