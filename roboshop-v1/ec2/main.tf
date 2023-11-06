data "aws_ami" "amiex" {
    owners=["973714476881"]
    most_recent=true
    name_regex="Centos-8-DevOps-Practice"
}

resource "aws_instance" "ec2ex"{
    ami=data.aws_ami.amiex.id
    instance_type="t3.small"
    tags={
        Name=var.name
    }
    vpc_security_group_ids = [aws_security_group.security_group_ex.id]

    provisioner "remote-exec" {
      connection {
        type="ssh"
        user="centos"
        password="DevOps321"
        host=self.public_ip
      }
      inline = [ 
        "sudo labauto ansible",
         "ansible-pull -i localhost, -U https://github.com/subbumarella35/roboshop-ansible.git -e role_name=${var.name} main.yml"
       ]
    } 
}

resource "aws_security_group" "security_group_ex"{
    name=var.name
    description="example security group"


    // Ingress rules (inbound traffic)
    ingress{
        description="SSH"
        from_port=0
        to_port=0
        protocol="-1"
        cidr_blocks=["0.0.0.0/0"]
    }
    egress{
        from_port=0
        to_port=0
        protocol="-1"
        cidr_blocks=["0.0.0.0/0"]
    }
    tags = {
        Name = var.name
    }

}

resource "aws_route53_zone" "roboshop_route53" {
  zone_id="Z04770651WQZPPJRLW6XF"
  name="${var.name}-dev"
  type="A"
  ttl="30"
  records =[aws_instance.ec2ex.private_ip]
}

variable "name"{}

