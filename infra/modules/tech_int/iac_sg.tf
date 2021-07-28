# https:#www.terraform.io/docs/providers/aws/r/security_group.html
resource "aws_security_group" "this" {
  name        = "tech-int-sg"
  vpc_id      = aws_vpc.this.id
  description = "Tech int Security Group"

  tags        = {
        Name        = "tech-int-sg"
        Description = "Tech int Security Group"
      }
}
