# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule
resource "aws_security_group_rule" "ingress_22" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.this.id
  description       = "EC2 Ingress rule for all access"
}

resource "aws_security_group_rule" "ingress_80" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.this.id
  description       = "EC2 Ingress rule for all access"
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule
resource "aws_security_group_rule" "egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.this.id
  description       = "EC2 egress rule for all access"
}
