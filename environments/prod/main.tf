# Contains Prod-specific configuration (using EC2 module)
module "ec2" {
  source         = "../../modules/ec2-setup"
  environment    = "prod"
  subnet_id      = aws_subnet.public_subnet_2.id
  security_group = aws_security_group.public_sg.id

  user_data = <<-EOF
        #!/bin/bash
        yum install -y nginx
        echo "server {
            listen 80;
            location / {
                proxy_pass http://${aws_instance.ec2_instance.private_ip};
            }
        }" > /etc/nginx/nginx.conf
        systemctl enable nginx
        systemctl start nginx
    EOF
}

module "ec2" {
  source         = "../../modules/ec2-setup"
  environment    = "prod"
  subnet_id      = aws_subnet.private_subnet.id
  security_group = aws_security_group.public_sg.id
}
