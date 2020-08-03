provider "aws" {
    region = "us-west-1"
}

resource "aws_instance" "Juan-TF-WL1" {
    ami = "ami-05655c267c89566dd"
    instance_type = "t2.micro"

    tags = {
        Name = "Ysa-Test-WL1"
    }
}
