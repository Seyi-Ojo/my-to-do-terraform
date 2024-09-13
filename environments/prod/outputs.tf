# Contains Prod-specific outputs
# modules/public-instance/outputs.tf
output "public_instance_ip" {
  value = aws_instance.public_instance.public_ip
}

# modules/private-instance/outputs.tf
output "private_instance_ip" {
  value = aws_instance.private_instance.private_ip
}
