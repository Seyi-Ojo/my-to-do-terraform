# Contains Prod-specific configuration (using EC2 module)
module "ec2" {
  source         = "../../modules/ec2-setup"
  environment    = "prod"
  subnet_id      = aws_subnet.public_subnet_2.id
  security_group = aws_security_group.public_sg.id

  user_data = var.user_data
}

