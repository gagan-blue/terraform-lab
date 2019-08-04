provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "s3lab" {
  bucket = "mybucket15apirl1986"
  #acl    = "public-write"
  region = "ap-south-1"

}

resource "aws_s3_bucket_object" "uploadfile" {
  bucket = "${aws_s3_bucket.s3lab.id}"
  source = "test.txt"
  key    = "tf/mytest.txt"
  //content = "application/json"
  //content= "binary/octet-stream"
  content_type="text/plain" #valid MIME Types
}

#after adding data / output run terraform refresh
data "aws_s3_bucket_object" "mys3object" {
  bucket = "${aws_s3_bucket.s3lab.id}"
  key    = "${aws_s3_bucket_object.uploadfile.key}"
}

output "s3file" {
  value = "${data.aws_s3_bucket_object.mys3object.body}"
}


#terraform state list

    #aws_s3_bucket.s3lab
    #aws_s3_bucket_object.uploadfile

#stdout of terraform apply

    #aws_s3_bucket_object.uploadfile: Creating...
    #aws_s3_bucket_object.uploadfile: Creation complete #after 1s [id=tf/mytest.txt]
    #data.aws_s3_bucket_object.mys3object: Refreshing state...

    #Apply complete! Resources: 1 added, 0 changed, 0 #destroyed.

    #Outputs:

    #s3file = to be upload to s3