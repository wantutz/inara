provider "aws" {
    region = "us-west-1"
}

resource "aws_instance" "Ysa-Workloads" {
    ami = "ami-05655c267c89566dd"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.instance.id]

    user_data = <<-EOF
               #!/bin/bash
               echo "Hello, World" > index.html
               nohup busybox httpd -f -p 8080 &
               EOF

    tags = {
        Name = "Ysa-Test-WL1"
    }
}

resource "aws_security_group" "instance" {
    name = "Ysa-WebApp-SecurityGroup"

    ingress {
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
