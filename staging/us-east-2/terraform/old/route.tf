############### Public Route Table ##############
resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.staging.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.staging.id
  }

  tags = {
    Name = "public-route-table"
  }
}

############ Public Route Table Association ####
resource "aws_route_table_association" "Pub_Sub_1" {
  subnet_id      = aws_subnet.staging_public_subnet_1.id
  route_table_id = aws_route_table.public-route-table.id
}

resource "aws_route_table_association" "Pub_Sub_2" {
  subnet_id      = aws_subnet.staging_public_subnet_2.id
  route_table_id = aws_route_table.public-route-table.id
}

############### Private Route Table #############

resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.staging.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.staging.id
  }

  tags = {
    Name = "private-route-table"
  }
}

############ Private Route Table Association ####
resource "aws_route_table_association" "Private_Sub_1" {
  subnet_id      = aws_subnet.staging_private_subnet_1.id
  route_table_id = aws_route_table.private-route-table.id
}

resource "aws_route_table_association" "Private_Sub_2" {
  subnet_id      = aws_subnet.staging_private_subnet_2.id
  route_table_id = aws_route_table.private-route-table.id
}