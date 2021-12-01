# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_interface
resource "aws_network_interface" "this" {
  subnet_id         = aws_subnet.this.id
  security_groups   = [aws_security_group.this.id]
  description       = "Technical interview ENI"

tags              = {
    Name = "Technical Interview ENI"
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
resource "aws_instance" "this" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.this.id
  user_data                   = base64encode(data.template_file.this.rendered)

  network_interface {
    device_index          = 0
    network_interface_id  = aws_network_interface.this.id
    delete_on_termination = false
  }

  tags                        = {
    Name = "Technical interview"
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair
resource "aws_key_pair" "this" {
  key_name   = "tech-int-key"
  public_key = file("${path.module}/id_rsa.pub")
}

