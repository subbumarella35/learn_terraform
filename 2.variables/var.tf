variable "sample"{
    default = "subbu"
} 
variable "intergervalue" {
  default=100
}

output "printing sample name" {
  value = var.sample
}
output "printing integer" {
  value=var.intergervalue
}