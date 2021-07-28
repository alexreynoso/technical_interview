# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table
resource "aws_route_table" "this" {
  vpc_id = aws_vpc.this.id
  tags   = {
      "Name"        = "tech-int-rtb-public-subnets"
      "Description" = "Tech int Public Subnet's Default Route Table"
    }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association
resource "aws_route_table_association" "this" {
  subnet_id      = aws_subnet.this.id
  route_table_id = aws_route_table.this.id
}

# ALL PUBLIC ROUTES GOES BELOW

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route
resource "aws_route" "igw" {
  gateway_id             = aws_internet_gateway.this.id
  route_table_id         = aws_route_table.this.id
  destination_cidr_block = "0.0.0.0/0"
}
