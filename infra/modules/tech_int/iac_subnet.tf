resource "aws_subnet" "this" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = aws_vpc.this.cidr_block
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags                    = {
    Name = "tech int public subnet"
  }
}
