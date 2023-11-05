data "aws_security_group" "example" {
   name = "allow-all"
}
output "Security_Details" {
  value=data.aws_security_group.example.id
}