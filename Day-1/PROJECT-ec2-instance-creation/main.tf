provider "aws" {
  region = "us-east-1" # Set your desired AWS region
}

resource "aws_instance" "example" {
  ami           = "ami-0e86e20dae9224db8" # Specify an appropriate AMI ID
  instance_type = "t2.micro"
  key_name      = "Terraform"
  user_data = <<-EOF
              #!/bin/bash
              # Update the package list
              apt-get update -y

              # Install Nginx
              apt-get install -y nginx

              # Create a custom index.html file
              echo "<html><body><h1>Hello from Terraform and Nginx on Ubuntu!</h1></body></html>" > /var/www/html/index.html

              # Start and enable Nginx service
              systemctl start nginx
              systemctl enable nginx
              EOF

  tags = {
    Name = "My-first-Instance" # Replace this with your desired name
  }


}

output "instance_id" {
  value       = aws_instance.example.id
  description = "The ID of the EC2 instance"
}

output "instance_public_ip" {
  value       = aws_instance.example.public_ip
  description = "The public IP address of the EC2 instance"
}

output "instance_type" {
    value = aws_instance.example.instance_type
    description = "This is going to give us what type of CPU Is"
  
}