data "aws_vpc" "default" {
  id = vpc-0a016050b9c426daa
}

resource "aws_instance" "ec2_instance" {
  ami             = var.ami
  instance_type   = var.instance_type
  subnet_id       = var.subnet_id
  security_groups = [var.security_group]

  # Adding the user_data argument
  user_data = var.user_data

  tags = {
    Name = "${var.environment}-instance"
  }
}
