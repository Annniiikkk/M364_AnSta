# Provider-Configuration
provider "aws" {
  region = "us-east-1"  # Passen Sie die Region nach Bedarf an
}

# Create security group
resource "aws_security_group" "db_server_sg" {
  name_prefix = "db-server-sg"

  # Allow incoming traffic on port 3306
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow outgoing conections
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Cloud-Init-Script to dataconfiguration
data "template_file" "cloud_init" {
  template = file("C:/Projects/M364_AnSta/KN09/cloud-init.yaml")
}

# Create EC2-Instance 
resource "aws_instance" "db_server" {
  ami           = "ami-0866a3c8686eaeeba"  
  instance_type = "t2.micro"

  # Add Security groups and user data
  security_groups = [aws_security_group.db_server_sg.name]
  user_data       = data.template_file.cloud_init.rendered

  # Add tags
  tags = {
    Name = "Terraform-DB-Server"
  }
}
