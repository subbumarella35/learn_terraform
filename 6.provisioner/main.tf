data "aws_ami" "amiex" {
    owners=["973714476881"]
    most_recent=true
    name_regex="Centos-8-DevOps-Practice"
}

resource "aws_instance" "ec2ex"{
    ami=data.aws_ami.amiex.id
    instance_type="t2.micro"
    tags={
        Name="Provisioner_Example"
    }
    vpc_security_group_ids = ["sg-04add09f73452cb05"]
}

provisioner "remote-exec" {
    connection {
        type="ssh"
        user="centos"
        password="DevOps321"
        host=self.public_ip
    }
    inline=[
        "sudo labauto ansible",
        "ansible-pull -i localhost, -U https://github.com/subbumarella35/roboshop-ansible.git -e role_name=frontend main.yml"
    ]


}