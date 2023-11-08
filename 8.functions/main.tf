# using foreach
# data "aws_ami" "example"{
#     owners=["973714476881"]
#     most_recent = true
#     name_regex="Centos-8-DevOps-Practice"
# }

# variable "classs" {    
#     type = set(string)
#     default=["frontend","mongodb","catelogue"]
# }

# resource "aws_instance" "web"{
#     for_each = var.classs
#     ami =   data.aws_ami.example.id
#     instance_type   ="t2.micro"
#     tags={
#         Name=each.value
#     }
# }  

# using set by use count
data "aws_ami" "example"{
    owners=["973714476881"]
    most_recent = true
    name_regex="Centos-8-DevOps-Practice"
}
variable "classs" {    
    type = set(string)
    default=["frontend","mongodb","catelogue"]
}
# Convert set to list if you want to use count
locals{
    my_list=tolist(var.classs)
}

resource "aws_instance" "web"{
    count = length(local.my_list)
    ami =   data.aws_ami.example.id
    instance_type   ="t2.micro"
    tags={
        Name=local.my_list[count.index]
    }
} 

