# Contains Dev-specific configuration (using EC2 module)
module "ec2" {
  source         = "../../modules/ec2-setup"
  environment    = "dev"
  subnet_id      = aws_subnet.public_subnet_1.id
  security_group = aws_security_group.public_sg.id
}


resource "aws_instance" "public_instance_1" {
  ami             = var.ami
  instance_type   = var.instance_type
  subnet_id       = aws_subnet.public_subnet_1.id
  security_groups = [aws_security_group.public_sg.name]

  tags = {
    Name = "PublicInstance1"
  }
}
