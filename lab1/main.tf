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

#https://docs.aws.amazon.com/cli/latest/userguide/cli-services-ec2-instances.html

    #Launching an Instance ====>  aws ec2 run-instances
    #Adding a Block Device to Your Instance
    #Adding a Tag to Your Instance ====> aws ec2 create-tags
    #Connecting to Your Instance
    #Listing Your Instances ====>  aws ec2 describe-instances
    #Terminating an Instance ====>    aws ec2 terminate-instances --instance-ids i-006e85279c0371775


#https://docs.aws.amazon.com/cli/latest/reference/ec2/describe-instances.html

    #describe-instances
    #[--filters <value>]
    #[--instance-ids <value>]
    #[--dry-run | --no-dry-run]
    #[--cli-input-json <value>]
    #[--starting-token <value>]
    #[--page-size <value>]
    #[--max-items <value>]
    #[--generate-cli-skeleton <value>]

#terraform output public-dns
    #[
    #  "ec2-13-232-177-218.ap-south-1.compute.amazonaws.com",
    #   "ec2-13-233-168-159.ap-south-1.compute.amazonaws.com",
    #]



#echo "aws_instance.apache.0.public_dns" | terraform console
    #ec2-13-232-177-218.ap-south-1.compute.amazonaws.com
#gagan-Tower> echo "aws_instance.apache.1.public_dns" | terraform console
    #ec2-13-233-168-159.ap-south-1.compute.amazonaws.com
