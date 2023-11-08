data "aws_ami" "example"{
    owners=["973714476881"]
    most_recent = true
    name_regex="Centos-8-DevOps-Practice"
}

variable "classs" {    
    type = map(string)
    default=["frontend","mongodb","catelogue"]
}

resource "aws_instance" "web"{
    for_each = var.classs
    ami =   data.aws_ami.example.id
    instance_type   ="t2.micro"
    tags={
        Name=each.value
    }
}  