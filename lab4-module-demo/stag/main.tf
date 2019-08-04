provider "aws" {
  region = "ap-south-1"
}

#1. This root module variable is for passing value child module's variable - ec2_type
variable "inst_type" {} 

#2. notice that we have not defined resources here

module "ec2" {
  source = "../modules_any_name/ec2"
  ec2_type="${var.inst_type}" 
  #3. ec2_type is child module's variable
}

#referencing child module's otput in root module's variable/resource/data/output block {
#  something = module.ec2.<output_variable>
#}

output "instance_ids" {
  value="${module.ec2.instance_ids}"
}



#4. *.tf code in ec2 module "../modules_any_name/ec2":
# provider block not defined in module

#  resource "aws_instance" "ec2vm" {
#    ami           = "${var.ami_id}"
#    instance_type = "${var.ec2_type}"
#    key_name = "${var.kp}"
#  }



#terraform state list
    #module.ec2.aws_instance.ec2vm

#terraform state show module.ec2.aws_instance.ec2vm

#less terraform.tfstate
    #"resources": [
    #    {
    #      "module": "module.ec2",


