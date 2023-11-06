data "aws_ami" "amiex" {
    owners=["973714476881"]
    most_recent=true
    name_regex="Centos-8-DevOps-Practice"
}

resource "aws_instance" "ec2ex"{
    ami=data.aws_ami.amiex.id
    instance_type="t2.micro"
    tags={
        Name=var.name
    }
    vpc_security_group_ids = [aws_security_group.security_group_ex.id]
}

resource "aws_security_group" "security_group_ex"{
    name="ex-allow-all"
    description="example security group"


    // Ingress rules (inbound traffic)
    ingress{
        description="SSH"
        from_port=22
        to_port=22
        protocol="tcp"
        cidr_blocks=["0.0.0.0/0"]
    }
    egress{
        from_port=0
        to_port=0
        protocol="-1"
        cidr_blocks=["0.0.0.0/0"]
    }
    tags = {
        Name = "example-security-group"
    }

}

variable "name"{}