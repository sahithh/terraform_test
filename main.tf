resource "aws_instance" "my-instance" {
  ami                         = "ami-007855ac798b5175e"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  key_name                    = aws_key_pair.my-instance.key_name
  tags = {
    Environment = "dev"
    Name        = "my-first-tf-instance"
  }
}

resource "aws_key_pair" "my-instance" {
  key_name   = "my-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDECBIgtbRdPImegiZa8vxVOAk+sqQahog330+NJkLMllW3bbCcME4zKWF0T8je4//XYCoExiWHyZDht7Cklbp4ZgM7tvEFvCDHwv63R+N/AIZ6hrtfCfaOsb3Xb2ofowUXKMC52ZNDsFeNhyX26wE4EQ+t5I8FVCsNzmLf9gMY2m/0MSjU+EbiWUyaUi5YkkvzHh9ypoeXo9Pqh0LfwoIYpv2+Y8FDfb+xsiREhEyosJDVnIWuKpJ+pgrOyZwmbMsKVnsTw1nAY11QN/scgNH+pe65SkQf1NKGssp5kvy2y2ey9FG8h+8TkAu9xObH0fOxbKfxlFuP1OST2F4x46BHSIZ07My0rg8J2Np3VfjZ3KXdUO2FiLJDqn78fww/qaS6UyPRFzRwRNZYMw4LwUIfjVRfWnDlYN3nuI126kWWzBUrVDy7wy2DRqE6kVgVT5wkWKeodGNPUgginE2byUxoFniqXV0rDihqo2Bei8T6ajTzAhH0O3FN6QyoIHUNSS0= sahithh@sahithhs-MBP"
}