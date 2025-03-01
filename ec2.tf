# #keypair set and download
# resource "tls_private_key" "my_key" {
#   algorithm = "RSA"
#   rsa_bits  = 2048
# }

# resource "aws_key_pair" "my_key_pair" {
#   key_name   = "var.key_name"
#   public_key = tls_private_key.my_key.public_key_openssh
# }

# resource "local_file" "private_key" {
#   filename        = "${path.module}/my-terraform-key.pem"
#   content         = tls_private_key.my_key.private_key_pem
#   file_permission = "0600"
# }



# 🖥️ EC2 Instance (Public Web Server)
resource "aws_instance" "web_server" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  subnet_id       = aws_subnet.public_subnet_1.id
  security_groups = [aws_security_group.ec2_sg.id]
  key_name        = "hcl-key" # Allow SSH access

  

  tags = { Name = "TF-WebServer" }

  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install -y httpd
    sudo systemctl start httpd
    sudo systemctl enable httpd
    echo "<h1>Hi Balu you application deployed congr</h1>" | sudo tee /var/www/html/index.html
    sudo chown -R apache:apache /var/www/html/
    sudo chmod -R 755 /var/www/html/
    sudo systemctl restart httpd
  EOF
}