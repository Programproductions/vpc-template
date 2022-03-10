
resource "aws_subnet" "template_private_sub_1" {
  vpc_id                  = aws_vpc.template.id
  cidr_block              = "10.${var.quad}.4.0/24"
  map_public_ip_on_launch = false
  availability_zone       = "${var.region}a"
  tags = {
    Name = "${var.application}-private-sub-1"
  }
}


resource "aws_subnet" "template_private_sub_2" {
  vpc_id                  = aws_vpc.template.id
  cidr_block              = "10.${var.quad}.5.0/24"
  map_public_ip_on_launch = false
  availability_zone       = "${var.region}b"
  tags = {
    Name = "${var.application}-private-sub-2"
  }
}


resource "aws_subnet" "template_private_sub_3" {
  vpc_id                  = aws_vpc.template.id
  cidr_block              = "10.${var.quad}.6.0/24"
  map_public_ip_on_launch = false
  availability_zone       = "${var.region}c"
  tags = {
    Name = "${var.application}-private-sub-3"
  }
}



