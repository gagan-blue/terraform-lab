provider "aws" {
  region = "ap-south-1"
}

#1. This root module variable is for passing value to child module's variable - ec2_type
variable "inst_type" {default= "t2.micro"} 

#2. notice that we have not defined resources here

module "ec2" {
  source = "../modules_any_name/ec2"
  ec2_type="${var.inst_type}" 
  #3. ec2_type is child module's variable
}

#cannot reference attributes of resources defined in child module from root module.

#referencing child module's output from root module (variable/resource/data/output block) {
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

#local variable
#echo var.inst_type | terraform console
  #t2.micro


#child module's output value
#echo "module.ec2.instance_ids" | terraform console


#local module's outputs
#terraform output
  #instance_ids = i-049d8d278a5348160
