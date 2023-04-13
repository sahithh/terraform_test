output "public_ip" {
  value = aws_instance.my-instance.public_ip
}

output "sg_id"{
  value = aws_security_group.my-instance-sg.id
}
output "instance_id"{
  value = aws_instance.my-instance.id
}