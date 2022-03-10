
#1 CREATE A VPC
resource "aws_vpc" "template" {
  cidr_block = "10.${var.quad}.0.0/16"
  tags = {
    Name = "${var.application}-${var.environment}"
  }
}

#2 CREATE A GATEWAY TO THE INTERNET
resource "aws_internet_gateway" "template" {
  vpc_id = aws_vpc.template.id
}



# 6  SECURITY GROUP TO ALLOW INTERNET TRAFFIC
resource "aws_security_group" "template_allow_web" {
  name        = "allow_web_traffic"
  description = "Allow web inbound traffic"
  vpc_id      = aws_vpc.template.id

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }



  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {
    Name = "${var.application}-${var.environment}-allow-web"
  }
}

#7 CREATE A NETWORK INTERFACE - to create private ip adddress
resource "aws_network_interface" "template_web_server" {
  subnet_id       = aws_subnet.template_pub_sub_1.id
  private_ips     = ["10.${var.quad}.1.50"]
  security_groups = [aws_security_group.template_allow_web.id]


}


resource "aws_eip" "template" {
  vpc = true
}

resource "aws_nat_gateway" "template" {
  allocation_id = aws_eip.template.id
  subnet_id     = aws_subnet.template_pub_sub_1.id
  depends_on    = [aws_internet_gateway.template]
}

resource "aws_route_table" "template_private" {
  vpc_id = aws_vpc.template.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.template.id
  }

  tags = {
    Name = var.application
  }
}

resource "aws_route_table_association" "template_private_1" {
  subnet_id      = aws_subnet.template_private_sub_1.id
  route_table_id = aws_route_table.template_private.id
}
resource "aws_route_table_association" "template_private_sub_2" {
  subnet_id      = aws_subnet.template_private_sub_2.id
  route_table_id = aws_route_table.template_private.id
}
resource "aws_route_table_association" "template_private_sub_3" {
  subnet_id      = aws_subnet.template_private_sub_3.id
  route_table_id = aws_route_table.template_private.id
}



