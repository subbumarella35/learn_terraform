resource "aws_instance" "Welcome"{
    ami="ami-03265a0778a880afb"
    instance_type="t2.micro"
    tags={
        Name="Hello worldd"
    }
}
