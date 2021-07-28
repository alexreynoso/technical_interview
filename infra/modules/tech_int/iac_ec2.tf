#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
resource "aws_instance" "this" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.this.id
  subnet_id                   = aws_subnet.this.id
  associate_public_ip_address = "true"
  vpc_security_group_ids      = [ aws_security_group.this.id ]
  user_data                   = base64encode(data.template_file.this.rendered)

  tags = {
    Name = "Technical interview"
  }
}

resource "aws_key_pair" "this" {
  key_name   = "tech-int-key"
  public_key = file("${path.module}/id_rsa.pub")
}
