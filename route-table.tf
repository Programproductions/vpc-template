

# 3 CREATE THE ROUTE TABLE
resource "aws_route_table" "template" {
  vpc_id = aws_vpc.template.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.template.id
  }

  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = aws_internet_gateway.template.id
  }

  tags = {
    Name = var.application
  }
}

# 5 ASSOCIATE THE SUBNET WITH THE ROUTE TABLE
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.template_pub_sub_1.id
  route_table_id = aws_route_table.template.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.template_pub_sub_2.id
  route_table_id = aws_route_table.template.id
}

resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.template_pub_sub_3.id
  route_table_id = aws_route_table.template.id
}


