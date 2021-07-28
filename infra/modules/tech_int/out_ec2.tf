output "ec2" {
  value = {
    "arn" = aws_instance.this.arn
    "public_ip" = aws_instance.this.public_ip
  }

}
