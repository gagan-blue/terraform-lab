provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "s3lab" {
  bucket = "mybucket15apirl1986"
  region = "ap-south-1"

}

resource "aws_s3_bucket_object" "uploadfile" {
  bucket = "${aws_s3_bucket.s3lab.id}"
  source = "test.txt"
  key    = "tf/mytest.txt"
  #content = "application/json"
  #content= "binary/octet-stream"
  content_type="text/plain" #valid MIME Types
}

#after adding data / output run terraform refresh
data "aws_s3_bucket_object" "mys3object" {
  bucket = "${aws_s3_bucket_object.uploadfile.bucket}"
  key    = "${aws_s3_bucket_object.uploadfile.key}"
}

output "s3file" {
  value = "${data.aws_s3_bucket_object.mys3object.body}"
}



#terraform state list

    #aws_s3_bucket.s3lab
    #aws_s3_bucket_object.uploadfile
    #data.aws_s3_bucket_object.mys3object

#stdout of terraform apply

    #aws_s3_bucket_object.uploadfile: Creating...
    #aws_s3_bucket_object.uploadfile: Creation complete #after 1s [id=tf/mytest.txt]
    #data.aws_s3_bucket_object.mys3object: Refreshing state...

    #Apply complete! Resources: 1 added, 0 changed, 0 #destroyed.
    #Outputs:
    #s3file = to be upload to s3



# terraform state show data.aws_s3_bucket_object.mys3object

#     body           = "to be upload to s3\n\n"
#     bucket         = "mybucket15apirl1986"
#     content_length = 20
#     content_type   = "text/plain"
#     etag           = "b46a5d880a2b68712de4ec91e53377ca"
#     id             = "mybucket15apirl1986/tf/mytest.txt"
#     key            = "tf/mytest.txt"
#     last_modified  = "Sun, 04 Aug 2019 12:27:09 UTC"
#     metadata       = {}
#     storage_class  = "STANDARD"
#     tags           = {}

# less terraform.tfstate


