data "aws_security_group" "example" {
   name = "allow-all"
}
output "Security_Details" {
  value="${data.aws_security_group.example.id} and vpc id is ${data.aws_security_group.example.vpc_id}"
}