provider "aws" {
  region     = "ap-south-1"
}

resource "aws_instance" "apache" {
  ami           = "ami-0693ef8916d694a6b"
  instance_type = "t2.micro"
  key_name = "dell-tower" # can also use 'data' to access list of all key-pair resources

  tags {
    Name = "apache-server"
  }
}
