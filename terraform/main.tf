terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
        }
    }
}

# aws Access keys
provider "aws" {
    access_key = var.access_key
    secret_key = var.secret_key
    region = "eu-west-1"

}

resource "aws_security_group" "my_default" {
    name = "Miguel_security_group"
    tags = {
      Name = "Miguel_security_group"
    }

    ingress {
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = [ var.cidr ]
    }

    ingress {
        from_port = 8081
        to_port = 8081
        protocol = "tcp"
        cidr_blocks = [ var.cidr ]
    }


    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [ var.cidr ]
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = [ var.cidr ]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [ var.cidr ]
    }
}

resource "aws_key_pair" "my_key" {
        key_name = "miguel_key"
        public_key = var.public_key
}

resource "aws_eip_association" "eip_asoc" {
    instance_id = aws_instance.my_ec2.id
    public_ip = var.elastic_ip
}

resource "aws_instance" "my_ec2" {
    ami = var.ami
    instance_type = var.box_size
    vpc_security_group_ids = [aws_security_group.my_default.id]
    user_data = file("/Users/miguel/Documents/automatedPipeline/initialScript.sh")
    key_name = aws_key_pair.my_key.key_name
    tags = {
        Name = "Miguel's box"
    }
}