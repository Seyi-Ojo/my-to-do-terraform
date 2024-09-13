resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = data.aws_vpc.default.id
  cidr_block              = "172.31.16.0/16"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = data.aws_vpc.default.id
  cidr_block              = "172.31.32.0/16"
  availability_zone       = "us-east-1e"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private_subnet" {
  vpc_id                  = data.aws_vpc.default.id
  cidr_block              = "172.31.64.0/16"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false
}


resource "aws_internet_gateway" "igw" {
  vpc_id = data.aws_vpc.default.id
}

resource "aws_route_table" "route_table" {
  vpc_id = data.aws_vpc.default.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "route_table_association" {
  subnet_id      = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]
  route_table_id = aws_route_table.route_table.id
}
