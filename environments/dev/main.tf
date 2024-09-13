# Contains Dev-specific configuration (using EC2 module)
module "ec2" {
  source         = "../../modules/ec2-setup"
  environment    = "dev"
  subnet_id      = aws_subnet.public_subnet_1.id
  security_group = aws_security_group.public_sg.id
}
