
resource "aws_subnet" "template_pub_sub_1" {
  vpc_id                  = aws_vpc.template.id
  map_public_ip_on_launch = true
  cidr_block              = "10.${var.quad}.1.0/24"
  availability_zone       = "${var.region}a"
  tags = {
    Name = "${var.application}-pub-sub-1"
  }
}

resource "aws_subnet" "template_pub_sub_2" {
  vpc_id                  = aws_vpc.template.id
  cidr_block              = "10.${var.quad}.2.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "${var.region}b"
  tags = {
    Name = "${var.application}-pub-sub-2"
  }
}


resource "aws_subnet" "template_pub_sub_3" {
  vpc_id                  = aws_vpc.template.id
  cidr_block              = "10.${var.quad}.3.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "${var.region}c"
  tags = {
    Name = "${var.application}-pub-sub-3"
  }
}





