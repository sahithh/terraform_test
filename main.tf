resource "aws_instance" "my-instance" {
  count = 3
  ami                         = "ami-007855ac798b5175e"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  key_name                    = aws_key_pair.my-instance.key_name
  vpc_security_group_ids      = [aws_security_group.my-instance-sg.id]
  lifecycle {
   create_before_destroy = true
  }
  tags = {
    Environment = "dev"
    Name        = "my-first-tf-ec2-${count.index}"
  }
}

resource "aws_key_pair" "my-instance" {
  key_name   = "my-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDECBIgtbRdPImegiZa8vxVOAk+sqQahog330+NJkLMllW3bbCcME4zKWF0T8je4//XYCoExiWHyZDht7Cklbp4ZgM7tvEFvCDHwv63R+N/AIZ6hrtfCfaOsb3Xb2ofowUXKMC52ZNDsFeNhyX26wE4EQ+t5I8FVCsNzmLf9gMY2m/0MSjU+EbiWUyaUi5YkkvzHh9ypoeXo9Pqh0LfwoIYpv2+Y8FDfb+xsiREhEyosJDVnIWuKpJ+pgrOyZwmbMsKVnsTw1nAY11QN/scgNH+pe65SkQf1NKGssp5kvy2y2ey9FG8h+8TkAu9xObH0fOxbKfxlFuP1OST2F4x46BHSIZ07My0rg8J2Np3VfjZ3KXdUO2FiLJDqn78fww/qaS6UyPRFzRwRNZYMw4LwUIfjVRfWnDlYN3nuI126kWWzBUrVDy7wy2DRqE6kVgVT5wkWKeodGNPUgginE2byUxoFniqXV0rDihqo2Bei8T6ajTzAhH0O3FN6QyoIHUNSS0= sahithh@sahithhs-MBP"
}

resource "aws_security_group" "my-instance-sg" {
  name        = "my-instance-sg"
  description = "Allow the traffic that can go outside and inside the instance"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allowing SSH to the Instance"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["203.192.214.113/32"]
  }

  ingress {
    description = "TLS from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "my-instance-sg"
  }
}